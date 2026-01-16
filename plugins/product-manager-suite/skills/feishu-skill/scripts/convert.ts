
import { fetchTenantAccessToken, feishuConfig, feishuDownload, DOCS_DIR } from "../../feishu-pages/src/feishu";
import { fetchDocBody } from "../../feishu-pages/src/doc";
import { Doc } from "../../feishu-pages/src/feishu";
import { replaceLinks, humanizeFileSize } from "../../feishu-pages/src/utils";
import path from "path";
import fs from "fs";
import dotenv from "dotenv";

// Load environment variables
const envPath = path.resolve(__dirname, "../../.env");
if (fs.existsSync(envPath)) {
  dotenv.config({ path: envPath });
} else {
  dotenv.config();
}

async function convertDoc(documentId: string, outputDir?: string) {
  // 1. Ensure Auth
  if (!feishuConfig.tenantAccessToken) {
    await fetchTenantAccessToken();
  }

  // 2. Determine Output Directory
  const baseDir = outputDir || path.resolve(process.cwd(), `${documentId}_download`);
  const assetsDir = path.join(baseDir, "assets");
  
  if (!fs.existsSync(baseDir)) {
    fs.mkdirSync(baseDir, { recursive: true });
  }

  console.log(`Downloading doc ${documentId} to ${baseDir}...`);

  // 3. Construct Doc Object
  const doc: Doc = {
    obj_token: documentId,
    node_token: documentId,
    title: "Unknown",
    depth: 0,
    children: [],
    has_child: false,
    obj_create_time: "",
    obj_edit_time: "", 
  };

  // 4. Fetch Body
  try {
    const result = await fetchDocBody(doc);
    
    if (result.contentFile && fs.existsSync(result.contentFile)) {
      let content = fs.readFileSync(result.contentFile, "utf-8");
      const fileTokens = result.fileTokens;

      // 5. Download Assets & Replace Links
      console.log("Downloading assets...");
      
      for (const fileToken in fileTokens) {
        let base_filename = fileToken;
        if (fileTokens[fileToken].type == 'board') {
          base_filename = base_filename + '-board';
        }

        const filePath = await feishuDownload(
          fileToken,
          path.join(assetsDir, base_filename),
          fileTokens[fileToken].type,
          result.hasCache,
        );

        if (filePath) {
          const extension = path.extname(filePath);
          const assetURL = `assets/${base_filename}${extension}`;
          content = replaceLinks(content, fileToken, assetURL);
        }
      }

      // 6. Save Markdown File
      const title = result.meta?.title || "feishu_doc";
      // Sanitize title for filename
      const safeTitle = title.replace(/[\/\\:*?"<>|]/g, "_");
      const mdPath = path.join(baseDir, `${safeTitle}.md`);
      
      fs.writeFileSync(mdPath, content);
      console.log(`\nSuccess! Document saved to:\n${mdPath}`);
      
    } else {
      console.error("Error: Failed to generate content file.");
      process.exit(1);
    }
  } catch (error) {
    console.error("Error converting document:", error);
    process.exit(1);
  }
}

// CLI Entrypoint
const args = process.argv.slice(2);
if (args.length < 1) {
  console.error("Usage: node convert.js <document_url_or_token> [output_dir]");
  process.exit(1);
}

const docId = extractToken(args[0]);
const outDir = args[1]; // Optional

convertDoc(docId, outDir);

function extractToken(input: string): string {
  // Handle URL input
  // Match patterns like:
  // https://xxx.feishu.cn/docx/doxcnXXXXXXXX
  // https://xxx.feishu.cn/wiki/wikcnXXXXXXXX
  // Ignore query parameters
  
  // 1. Try to parse as URL to remove query params cleanly
  let pathname = input;
  try {
    const url = new URL(input);
    pathname = url.pathname;
  } catch (e) {
    // Not a valid URL, treat as raw string (maybe just token)
  }

  const urlPattern = /(?:docx|wiki)\/([a-zA-Z0-9]+)/;
  const match = pathname.match(urlPattern);
  
  if (match && match[1]) {
    return match[1];
  }
  
  // If no URL pattern matched, assume input is the token itself
  // Remove any potential query params if user pasted "token?foo=bar"
  return input.split('?')[0];
}

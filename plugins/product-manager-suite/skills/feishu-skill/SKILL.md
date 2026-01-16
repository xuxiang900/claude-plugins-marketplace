---
name: feishu-doc-to-markdown
description: Convert a Feishu (Lark) document to Markdown format.
---

# Feishu Document to Markdown

This skill allows you to convert a Feishu (Lark) document into Markdown format.

## Requirements

- Node.js environment
- Access to the `feishu-pages` project dependencies
- Valid Feishu API credentials configured in `.env`

## Usage

When the user asks to "convert a Feishu document" or provides a Feishu document URL/Token and asks for its content in Markdown, use the provided script.

1.  **Extract the Document Token**:
    -   Pass the full URL (e.g., `https://feishu.cn/wiki/abc?from=xxx`) or the token directly. The script handles parameter stripping.

2.  **Run the Conversion Script**:
    
    ```bash
    # Usage: node feishu-skill/dist/index.js <url_or_token> [output_dir]
    
    # Example 1: Download to default folder ({token}_download)
    node feishu-skill/dist/index.js https://feishu.cn/docx/doxcn12345
    
    # Example 2: Download to specific folder
    node feishu-skill/dist/index.js https://feishu.cn/docx/doxcn12345 ./my-docs/intro
    ```

3.  **Output**:
    -   The script **downloads** the Markdown file and all images to the target directory.
    -   It prints the final file path to stdout.
    -   Directory structure:
        ```text
        output_dir/
        ├── Document Title.md
        └── assets/
            ├── image1.png
            └── ...
        ```
    -   **Action for Claude**: After the script finishes, you should tell the user where the file is saved, or read the generated Markdown file if the user asked to "read" the content.

## Examples

**User:** "Download doc https://feishu.cn/docx/abc"
**Action:** Run `node feishu-skill/dist/index.js https://feishu.cn/docx/abc`

**User:** "Read content of doc `doxcn123`"
**Action:** 
1. Run `node feishu-skill/dist/index.js doxcn123`
2. Capture the output path (e.g. `doxcn123_download/Title.md`)
3. Read that file using `cat` or file reading tool.

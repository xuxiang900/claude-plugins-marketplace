---
description: 规范化Git提交 (Angular规范)
argument-hint: "[commit message hint]"
allowed-tools:
  - Bash
  - Read
---

# 规范化 Git 提交 (Angular Commit Convention)

请执行严格遵循 Angular 规范的 Git 提交，消息内容：$ARGUMENTS

## Angular 提交规范

**提交消息格式**：
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type (类型) - 必选
- **feat**: 新功能 (feature)
- **fix**: 修复 bug
- **docs**: 仅文档变更
- **style**: 代码格式变更 (不影响代码含义，如空格、格式化、缺失分号等)
- **refactor**: 重构 (既非新功能也非 bug 修复的代码变更)
- **perf**: 性能优化
- **test**: 添加或修正测试
- **chore**: 构建过程或辅助工具的变更 (如依赖更新、配置变更)
- **ci**: CI/CD 配置文件和脚本的变更
- **build**: 影响构建系统或外部依赖的变更
- **revert**: 回滚之前的提交

### Scope (范围) - 可选
- 影响的模块、组件或文件范围
- 例如：(auth), (parser), (compiler), (ui)

### Subject (主题) - 必选
- 简明扼要描述变更
- 使用祈使句，现在时态："change" 而非 "changed" 或 "changes"
- 首字母小写
- 末尾不加句号

### Body (正文) - 可选
- 详细说明变更的动机和对比
- 使用祈使句，现在时态
- 可以包含多段

### Footer (脚注) - 可选
- Breaking Changes: 不兼容变更说明
- Issue references: 关联的 Issue (如 Closes #123)

## 提交流程

1. **检查暂存区状态**：
   - 运行 `git status` 查看文件变更
   - 运行 `git diff --cached` 查看已暂存的变更
   - 如果暂存区为空，运行 `git diff` 查看工作区变更

2. **处理未跟踪的新文件**：
   - 检查是否存在 untracked files（新文件）
   - 如果有新文件，**先询问用户**是否要将它们添加到暂存区
   - 列出所有新文件，等待用户确认后再添加
   - 用户可以选择：全部添加、部分添加、或跳过

3. **添加已跟踪文件的变更**：
   - 使用 `git add -u` 添加已跟踪文件的修改和删除
   - **注意**: -u 参数只会暂存修改和删除的文件，不会添加新文件

4. **分析变更并确定 type**：
   - 根据代码变更内容智能识别最合适的 type
   - 确定影响范围作为 scope (如果适用)
   - 遵循 Angular 规范的严格要求

5. **生成提交信息** (英文)：
   ```
   <type>(<scope>): <subject>

   <body>

   Co-Authored-By: yong.li <yong.li@goland.cn>
   Co-Authored-By: yanding.zhang <yanding.zhang@goland.cn>
   ```

6. **执行提交**：
   - 使用 heredoc 格式化的提交信息
   - 确认提交成功并显示提交信息

## 示例

```bash
# 好的提交消息示例
feat(auth): add JWT token validation

Implement token validation middleware for API routes.
Add expiration check and signature verification.

Co-Authored-By: yong.li <yong.li@goland.cn>
Co-Authored-By: yanding.zhang <yanding.zhang@goland.cn>
```

```bash
# 修复 bug
fix(parser): handle null values in JSON response

Fixes #234
```

```bash
# 重构代码
refactor(downloader): extract CLI wrapper to base class

Move common process management logic to CLIDownloader base class.
This improves code reusability and maintainability.
```

## 重要提示

- **提交信息必须使用英文**
- **严格遵循 Angular 规范格式**
- **新文件必须先询问用户是否添加**，避免遗漏
- **使用 `git add -u` 只暂存已跟踪文件的变更**
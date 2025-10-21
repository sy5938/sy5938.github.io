 # Repository Guidelines（针对新架构已更新）

 本仓库采用 Quarto 构建静态网站，导航与主题集中在 `_quarto.yml` 维护；内容按“顶层页面 + 专题目录”组织，输出统一至 `docs/` 并用于 GitHub Pages 发布。

 ## 项目结构与模块组织
 - 顶层页面：根目录放主要入口与频道页 `*.qmd`/`*.md`（如 `index.qmd`、`blog.qmd`、`codes.qmd`、`Chinese.qmd`、`publications.qmd`）。
 - 站点配置：`_quarto.yml`（导航、主题、输出目录、页脚、仓库链接等）。
 - 代码笔记频道：`codes/` 采用“年份/文章”分层：如 `codes/2025/2025-09-30-ggplot2.qmd`。
   - 元数据继承：`codes/_metadata.yml` 统一注入样式与 TOC 等设置。
   - 列表页：`codes.qmd` 使用 `listing` 自动聚合 `codes/` 下的内容（按 `date desc` 排序）。
 - 资源与样式：`images/`（图片资产，按主题分子目录）、`styles.scss`（全站主题与变量）。
 - HTML 片段：`_includes/`（如 `codes-styles.html`，由频道或页面按需 `include-in-header` 引用）。
 - 扩展：`_extensions/`（Quarto 扩展，包含 `coatless/webr` 相关文件，勿直接改动其生成代码）。
 - 生成产物：`docs/`（GitHub Pages 发布目录）—请勿手改，改源文件后统一渲染生成。
 - 开发缓存：`.quarto/`（无需手动修改）。

 ## 内容与命名约定
 - YAML 头部：使用 2 空格缩进；键名统一小写-连字符（如 `page-footer`、`site-url`）。
 - 页面命名：顶层页面用小写-连字符（如 `about-team.qmd`）。
 - Codes 文章：采用 `YYYY-MM-DD-主题.qmd` 命名，置于按年份分组目录（如 `codes/2025/…`）。
 - 资源引用：图片统一放入 `images/`，并按主题分子目录管理；页面内使用相对路径。
 - 样式维护：尽量集中到 `styles.scss`，避免零散内联样式；优先复用已定义 Sass 变量与色板。

 ## 构建与本地开发
 - `quarto check`：检查本地 Quarto 与依赖。
 - `quarto preview`：本地预览并监听变更（默认 http://localhost:4200）。
 - `quarto render`：渲染全站到 `_quarto.yml: output-dir`（本仓库为 `docs/`）。
 - `quarto clean`：清理构建缓存与中间文件。
 - 渲染单页示例：`quarto render codes/2025/2025-09-30-ggplot2.qmd`。
 - 工作流建议：修改内容 → `quarto preview` 验证导航/TOC/图片/链接 → `quarto render` → 提交包含 `docs/` 的更新。

 ## 样式与扩展
 - 主题入口：`styles.scss`。若需频道定制（如 Codes 列表页），通过页面 YAML 的 `include-in-header` 引用 `_includes/` 片段（参考 `codes/_metadata.yml` 与 `codes.qmd`）。
 - 扩展管理：扩展文件存放于 `_extensions/`，不建议直接改动第三方扩展生成文件；如需调整，优先在页面/样式层做覆盖。

 ## 测试清单
 - 预览检查：导航、面包屑/页面导航、TOC、链接、图片、表格、代码高亮是否正常。
 - 终端报错：`quarto preview` 控制台无明显报错与 404；移动/桌面端样式无错位。
 - 生成一致性：`quarto render` 后 `docs/` 内容与预览一致（含 `search.json`、`sitemap.xml` 等）。

 ## 提交与 Pull Request 规范
 - Commit 信息：动词开头、简洁明确，建议前缀（`feat:`、`fix:`、`docs:`、`update:`）。
   - 例：`update: 调整 navbar 配色并修复外链`。
 - PR 要求：说明变更动机与范围、关联 issue、必要截图/预览说明；包含已渲染的 `docs/` 变更。
 - 发布目录：禁止直接修改 `docs/` 源文件，所有改动需通过渲染生成。

 ## 安全与配置提示
 - 站点信息集中在 `_quarto.yml: website.*` 维护；外链尽量使用 `https`。
 - 新增页面后，记得更新 `_quarto.yml: navbar` 菜单；新增 Codes 文章遵循年份分组与命名约定。
 - 禁止提交密钥与敏感信息。

 ## 常见操作示例
 - 新增 Codes 文章：
   1) 创建文件：`codes/2025/2025-10-21-my-topic.qmd`
   2) 添加 YAML 头并撰写内容（日期、标题、分类等）
   3) 预览：`quarto preview`
   4) 渲染：`quarto render`
   5) 提交：包含源文件与 `docs/` 渲染结果
 - 新增顶层页面：
   1) 在根目录添加如 `about-team.qmd`
   2) 在 `_quarto.yml: navbar` 增加菜单项并指向该文件
   3) 预览与渲染同上

 ---
 面向自动化代理（AGENTS）提示：本文件对整个仓库生效。进行任何改动时，务必遵循以上结构、命名与渲染流程；严禁直接编辑 `docs/`。如需对频道进行样式或布局调整，优先通过 `styles.scss`、页面 YAML 或 `_includes/` 片段实现，不要直接改动第三方扩展代码。

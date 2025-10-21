 # Repository Guidelines
 
 ## 项目结构与模块组织
 - 根目录存放内容页：`*.qmd`/`*.md`（如 `index.qmd`、`blog.qmd`）。
 - 站点配置：`_quarto.yml`（导航、主题、输出目录等）。
 - 资源与样式：`images/`（图片资产）、`styles.scss`（自定义主题）。
 - 扩展：`_extensions/`（如有，放 Quarto 扩展）。
 - 生成产物：`docs/`（GitHub Pages 使用的发布目录）—请勿手改，改源文件后重新渲染。
 - 开发缓存：`.quarto/`（无需手动修改）。
 
 ## 构建、测试与本地开发命令
 - `quarto check`：检查本地 Quarto 安装与依赖。
 - `quarto preview`：本地预览并监听变更（默认 http://localhost:4200）。
 - `quarto render`：渲染站点到 `_quarto.yml` 中的 `output-dir`（本仓库为 `docs/`）。
 - `quarto clean`：清理构建缓存与中间文件。
 示例：修改 `index.qmd` 后，先 `quarto preview` 查看，再 `quarto render` 提交更新的 `docs/`。
 
 ## 编码风格与命名规范
 - Markdown/Quarto：YAML 头部使用 2 空格缩进；键名小写-连字符（如 `page-footer`）。
 - 文件命名：页面采用小写-连字符（如 `about-team.qmd`）；图片放 `images/` 并按主题分子目录。
 - 样式：统一编辑 `styles.scss`，避免散落内联样式；颜色与变量优先复用已定义变量。
 
 ## 测试指南
 - 以预览为主：确保导航、目录（TOC）、链接与图片在 `quarto preview` 中正常。
 - 多端检查：桌面与移动端均应无样式错位；控制台无明显报错。
 - 生成物一致：运行 `quarto render`，确认 `docs/` 中页面与预览一致。
 
 ## 提交与 Pull Request 规范
 - 提交信息：动词开头、简洁明了，建议使用前缀（如 `feat:`、`fix:`、`docs:`、`update:`）。
   例：`update: 调整 navbar 颜色并修复链接`。
 - PR 要求：说明变更动机与范围、关联 issue、必要截图/预览说明；包含已渲染的 `docs/` 变更。
 - 禁止直接改动 `docs/`：除渲染输出外，不应手改发布目录文件。
 
 ## 安全与配置提示（可选）
 - 不要提交密钥与敏感信息；外链尽量使用 `https`；站点基础信息在 `_quarto.yml: website.*` 维护。
 - 若新增页面，请同步更新 `_quarto.yml` 的 `navbar` 菜单。

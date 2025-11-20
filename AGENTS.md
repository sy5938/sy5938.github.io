# Repository Guidelines

## 项目结构与模块组织
- 顶层页面：根目录 `*.qmd`/`*.md`（如 `index.qmd`、`codes.qmd`）。
- 站点配置：`_quarto.yml`（导航、主题、输出目录）。
- 代码笔记：`codes/` 按 年/文章（如 `codes/2025/2025-09-30-ggplot2.qmd`），继承 `codes/_metadata.yml`。
- 列表页：`codes.qmd` 使用 `listing` 聚合 `codes/`（`date desc`）。
- 资源/样式：`images/`、`styles.scss`；片段：`_includes/`。
- 扩展：`_extensions/`（含 `coatless/webr`，勿直接改动）。
- 生成产物：`docs/`（GitHub Pages），禁止手改；缓存：`.quarto/`。

## 构建、测试与本地开发
- `quarto check`：检查本地 Quarto 与依赖。
- `quarto preview`：本地预览并监听（默认 http://localhost:4200）。
- `quarto render`：渲染到 `_quarto.yml: output-dir`（本仓库为 `docs/`）。
- `quarto clean`：清理构建缓存。
- 单页渲染：`quarto render codes/2025/2025-09-30-ggplot2.qmd`。

## 代码风格与命名
- YAML 使用 2 空格缩进；键名小写-连字符（如 `page-footer`）。
- 顶层页面文件名小写-连字符；Codes 文章 `YYYY-MM-DD-主题.qmd`，按年份分目录。
- 图片放 `images/` 子目录，页面内相对路径引用。
- 样式集中在 `styles.scss`；频道定制通过页面 YAML `include-in-header` 引用 `_includes/`。

## 测试指引
- 预览检查：导航/面包屑、TOC、链接、图片、表格、代码高亮。
- 终端无报错与 404；移动/桌面端样式无错位。
- 渲染后 `docs/` 与预览一致（含 `search.json`、`sitemap.xml`）。

## Commit 与 Pull Request
- Commit 前缀：`feat:`、`fix:`、`docs:`、`update:`（例：`update: 调整 navbar 配色并修复外链`）。
- PR 需说明动机与范围、关联 issue、必要截图/预览说明，并包含渲染后的 `docs/` 变更。
- 禁止直接编辑 `docs/`，一切改动经渲染生成。

## 安全与代理提示
- 站点信息集中维护于 `_quarto.yml: website.*`；外链尽量使用 `https`。
- 新增页面后更新 `_quarto.yml: navbar`；遵循年份分组与命名约定。
- 代理与贡献者：勿改动第三方扩展生成代码；优先通过 `styles.scss`、页面 YAML 或 `_includes/` 覆盖。


# 2025-11-20

- 桌面端主题切换按钮固定在导航右上角（约 top/right 14px，高度 20px），移动端隐藏浮动按钮，导航折叠菜单尾部动态生成“主题”入口，与桌面按钮同步状态。
- 主题切换脚本统一入口 `applyTheme`/`syncToggleState`，桌面与移动 nav 项共享图标、文案、`aria-pressed`，并侦听 `prefers-color-scheme` 自动跟随系统。
- 微调导航栏明/暗主题底色与文字色，切换时对比更清晰，与主题色保持一致。
- 首页 About 区域链接去除按钮样式（无边框/背景/额外内边距），使用站点全局的链接颜色与悬停色。
- 主题入口位置说明：`_quarto.yml` 仅通过 `include-after-body: _includes/theme-toggle.html` 注入按钮/脚本，桌面按钮位置由 `styles.scss`（`position: fixed; top/right: 14px`）控制；移动端菜单项由 `_includes/theme-toggle.html` 内的 `createMobileToggle()` 在 `.navbar-nav` 末尾 `appendChild` 动态插入，而非写在导航 YAML。

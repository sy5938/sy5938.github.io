#!/usr/bin/env Rscript

# 用法
#   Rscript ggside_margin.R
# 产物
#   在仓库根目录生成 1:1 PNG：scatter_marginal_ggside.png（1600x1600 像素）
# 说明
#   使用 ggside 在主散点图的上/右侧添加密度侧图：geom_xsidedensity 与 geom_ysidedensity。

ensure_package <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg, repos = 'https://cloud.r-project.org')
  }
  suppressWarnings(suppressPackageStartupMessages(library(pkg, character.only = TRUE)))
}

ensure_package('ggplot2')
ensure_package('ggside')

set.seed(42)
stopifnot(nrow(iris) > 0)

# 配色（尽量贴近示例：酒红/蓝/金）
pal <- c(
  setosa     = '#9e2f2f',
  versicolor = '#2f6db5',
  virginica  = '#d4a017'
)

df <- transform(iris, grp = Species)

x_rng <- range(df$Sepal.Length)
y_rng <- range(df$Sepal.Width)

p <- ggplot(df, aes(Sepal.Length, Sepal.Width, colour = grp)) +
  # 主图：散点 + 分组线性拟合（灰色置信带）
  geom_smooth(method = 'lm', se = TRUE, fill = 'grey70', alpha = 0.35, linewidth = 0.9) +
  geom_point(size = 2.3, alpha = 0.95) +
  # 上侧密度（按组覆盖，不叠加堆栈）
  ggside::geom_xsidedensity(aes(y = after_stat(density), fill = grp),
                            position = 'identity', alpha = 0.6, linewidth = 0.3) +
  # 右侧密度（水平显示）
  ggside::geom_ysidedensity(aes(x = after_stat(density), fill = grp),
                            position = 'identity', alpha = 0.6, linewidth = 0.3) +
  scale_colour_manual(values = pal, name = 'grp') +
  scale_fill_manual(values = pal, name = 'grp') +
  scale_x_continuous(limits = x_rng, expand = expansion(mult = 0)) +
  scale_y_continuous(limits = y_rng, expand = expansion(mult = 0)) +
  labs(x = 'Sepal.Length', y = 'Sepal.Width') +
  # 换主题：白底+网格
  #theme_classic()+
  theme_bw(base_size = 14) +
  theme(
    legend.position = 'right',
    # 为整张图增加少量白色边距，弱化边缘突兀
    plot.margin = margin(8, 8, 8, 8),
    plot.background = element_rect(fill = 'white', colour = NA),
    # 主面板细黑边（可按需去掉）
    panel.border = element_rect(colour = 'black', fill = NA, linewidth = 1),
    # 侧面板尺寸与背景：白底，无描边
    ggside.panel.scale = 0.18,
    ggside.panel.background = element_rect(fill = 'white', colour = NA),
    ggside.panel.border = element_blank()
  ) +
  theme_ggside_classic() +
  guides(fill = 'none')
# 为主图附上 theme_bw(), 为侧图附上 theme_ggside_classic()

ggsave(
  filename = 'scatter_marginal_ggside.png',
  plot = p,
  width = 1600, height = 1600, units = 'px', dpi = 150
)

cat('Created scatter_marginal_ggside.png\n')

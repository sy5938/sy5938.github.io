calc_tree_importance_value <- function(df,
                                      plot_col = "小样方",
                                      species_col = "sp.china",
                                      dbh_col = "dbh2011",
                                      dbh_unit = c("cm", "mm", "m")) {
  dbh_unit <- match.arg(dbh_unit)

  need <- c(plot_col, species_col, dbh_col)
  miss <- setdiff(need, names(df))
  if (length(miss)) stop("缺少列：", paste(miss, collapse = ", "))

  plot_id <- as.character(df[[plot_col]])
  species <- as.character(df[[species_col]])
  dbh <- suppressWarnings(as.numeric(df[[dbh_col]]))

  ok <- !is.na(plot_id) &
    plot_id != "" &
    !is.na(species) &
    species != "" &
    !is.na(dbh) &
    dbh > 0
  plot_id <- plot_id[ok]
  species <- species[ok]
  dbh <- dbh[ok]

  dbh_m <- switch(dbh_unit, cm = dbh / 100, mm = dbh / 1000, m = dbh)
  basal_area_m2 <- pi * (dbh_m / 2)^2

  n_i <- tapply(species, species, length)
  f_i <- tapply(plot_id, species, function(x) length(unique(x)))
  ba_i <- tapply(basal_area_m2, species, sum)

  rel_density <- as.numeric(n_i / sum(n_i) * 100)
  rel_frequency <- as.numeric(f_i / sum(f_i) * 100)
  rel_dominance <- as.numeric(ba_i / sum(ba_i) * 100)

  importance_value <- (rel_density + rel_frequency + rel_dominance) / 3

  out <- data.frame(
    相对密度 = rel_density,
    相对频度 = rel_frequency,
    相对优势度 = rel_dominance,
    重要值 = importance_value,
    row.names = names(n_i)
  )

  out[order(out$重要值, decreasing = TRUE), , drop = FALSE]
}
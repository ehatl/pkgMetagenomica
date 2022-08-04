#' Crea un heatmap de una matrix de expresion con valores mayores a un cutoff
#'
#' @param x A expression matrix with especies x genes
#' @param cutoff numeric()
#'
#' @return A ComplexHeatmap object
#' @export
#'
#' @examples
#' #' # create expresion matrix
#' expresion_genes <- matrix(rnorm(100), nrow = 10)
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#'
#' filter_matrix(expresion_genes, 0.5)
#'
filter_matrix <- function(x, cutoff =0 ) {
  #filter matrix
  filter_x <- x

  filter_x[filter_x <= cutoff] = NA



  # plot heatmap
  ComplexHeatmap::Heatmap(filter_x,
                          cluster_columns = FALSE,
                          cluster_rows = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}

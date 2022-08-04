#' Crea un heatmap con un subgrupo de genes y especies
#'
#' @param x A expression matrix with especies x genes
#' @param especies character() especies to subset
#' @param genes character() genes to subset
#'
#' @return A ComplexHeatmap object
#' @export
#'
#' @examples
#' # create expresion matrix
#' expresion_genes <- matrix(rnorm(100), nrow = 10)
#' rownames(expresion_genes) <- paste0("gene_",letters[1:10])
#' colnames(expresion_genes) <- paste0("especie_",letters[1:10])
#'
#' subset_heatmap(expresion_genes,
#' especies = c("especie_a", "especie_b","especie_c"),
#' genes = c("gene_d","gene_e","gene_f"))
#'
subset_heatmap <- function(x, especies = NULL, genes = NULL) {
  stopifnot("x must be a matrix" = inherits(x, "matrix"))
  stopifnot("Especies y genes deben de tipo character",
            is.character(especies) && is.character(genes))
  # subset matrix
  x_subset <- x[genes, especies]

  # plot heatmap
  ComplexHeatmap::Heatmap(x_subset,
                          cluster_columns = FALSE,
                          heatmap_legend_param = list(title = "log2"))
}









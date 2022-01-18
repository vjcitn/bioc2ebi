#' use rvest to scrape name and version from packages/bioc for early releases
#' @importFrom rvest html_nodes read_html html_table
#' @param vers character(1) version "x.y"
#' @export
scrape_early_bioc = function(vers="1.5", type="src") {
 v = strsplit(vers, "\\.")[[1]]
 if (v[1] != "1") stop("version component 1 must be 1")
 if (!(v[2] %in% c("5", "6", "7"))) stop("only works for versions 1.5 - 1.7")
 stopifnot(type %in% c("src", "Win32"))
 soft_url = sprintf("https://bioconductor.org/packages/bioc/%s/src/contrib/html/", vers)
 x = try(rvest::read_html(soft_url))
 if (inherits(x, "try-error")) stop("read_html failed")
 nodes = rvest::html_nodes(x,xpath='//*/table')
 tab = rvest::html_table(nodes)
 tabb = tab[[1]][-1,]
 pks = tabb[[1]]
 verstags = tabb[[2]]
 list(pks = pks, verstags=verstags)
}


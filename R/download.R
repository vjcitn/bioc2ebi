#' download packages for a version 1.5-1.7
#' @param vers character(1) defaults to "1.5"
#' @param type character(1) in c("src", "win")
#' @export
download_early_bioc = function(vers="1.5", type="src") {
  target_folder = sprintf("bioc_%s_%s", vers, type)
  dir.create(target_folder)
  suffix = ifelse(type == "src", ".tar.gz", ".zip")
  comp = ifelse(type=="src", "Source", "Win32")
  mk_url = function(biocvers, comp, pkgname, pkgversion, suffix)
    sprintf("https://bioconductor.org/packages/bioc/%s/src/contrib/%s/%s_%s%s",
             biocvers, comp, pkgname, pkgversion, suffix)
  dat = scrape_early_bioc(vers=vers)
  npacks = length(dat$pks)
  for (i in seq_len(npacks)) {
   try(download.file(mk_url(vers, comp, dat$pks[i], dat$verstags[i], suffix), 
        destfile=paste0(target_folder, "/", dat$pks[i], "_", dat$vers[i], suffix)))
  }
}

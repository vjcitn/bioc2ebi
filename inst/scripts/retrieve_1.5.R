# x = read_html("https://bioconductor.org/packages/bioc/1.5/src/contrib/html/")
# nodes = html_nodes(x,xpath='//*/table')
# tab = html_table(nodes)


# tabb = tab[[1]][-1,]

# pks = tabb[[1]]
# vers = tabb[[2]]

src_url_1.5 = function(pkg, pkgversion)
sprintf("https://bioconductor.org/packages/bioc/1.5/src/contrib/Source/%s_%s.tar.gz",
  pkg, pkgversion)

win_url_1.5 = function(pkg, pkgversion)
sprintf("https://bioconductor.org/packages/bioc/1.5/src/contrib/Win32/%s_%s.zip",
  pkg, pkgversion)

pks = c("aCGH", "affy", "affycomp", "affydata", "affylmGUI", "affypdnn", 
"affyPLM", "altcdfenvs", "annaffy", "AnnBuilder", "annotate", 
"apComplex", "arrayMagic", "arrayQuality", "bim", "Biobase", 
"Biostrings", "ChromoViz", "convert", "ctc", "daMA", "DEDS", 
"DNAcopy", "DynDoc", "EBarrays", "ecolitk", "edd", "exprExternal", 
"externalVector", "factDesign", "gcrma", "genArise", "genefilter", 
"geneplotter", "geneplotter", "GeneSpring", "GeneTraffic", "GeneTS", 
"GLAD", "globaltest", "goCluster", "GOstats", "GOstats", "goTools", 
"gpls", "graph", "GraphAT", "gtkWidgets", "HEM", "hexbin", "hopach", 
"Icens", "impute", "iSPlot", "KEGGSOAP", "limma", "limmaGUI", 
"LPE", "makecdfenv", "marray", "matchprobes", "MeasurementError.cor", 
"MergeMaid", "MLInterfaces", "msbase", "multtest", "nnNorm", 
"OLIN", "OLINgui", "pairseqsim", "pamr", "pickgene", "prada", 
"PROcess", "qvalue", "rama", "RBGL", "Rdbi", "RdbiPgSQL", "reposTools", 
"Resourcerer", "Rgraphviz", "RMAGEML", "ROC", "RSNPper", "Ruuid", 
"SAGElyzer", "siggenes", "simpleaffy", "SNAData", "splicegear", 
"stam", "stepNorm", "tkWidgets", "twilight", "vsn", "webbioc", 
"widgetInvoke", "widgetTools")

vers = c("1.1.4", "1.5.8-1", "1.4.3", "1.4.0", "1.2.5", "1.1-0", "1.2.5", 
"1.1-8", "1.0.11", "1.4.21", "1.5.1-1", "1.0.1", "1.5.0", "1.0.7", 
"1.01-1", "1.5.0", "1.0.0", "1.0", "1.1.9", "1.2.7", "1.0.1", 
"1.0.3", "1.1.0", "1.5.0", "1.0-19", "1.0-1", "1.5.0", "1.0.0", 
"1.0.14", "1.1.4", "1.1.3", "1.0.0", "1.5.0", "1.5.0", "1.5.2", 
"1.0.3", "1.0.6", "2.3", "1.0.1", "3.0.2", "1.0.0", "1.1.0", 
"1.1.1", "1.0.3", "1.0.6", "1.5.1", "1.0.0", "0.6.6", "1.0.4", 
"1.0.10", "1.0", "1.0.0", "1.0.2", "1.0.3", "0.6.5", "1.8.6", 
"1.3.6", "1.1.5", "1.4.8", "1.5.25", "1.0.12", "1.0.2", "2.0-1", 
"1.0.0", "1.0.0", "1.5.2", "1.0.1", "1.3.2", "1.0.1", "1.0.4", 
"1.22", "1.0.0", "1.1.9", "1.3.2", "1.1", "1.0.1", "1.3.7", "1.0.4", 
"1.0.9", "1.5.2", "1.0.4", "1.5.0", "2.1.0", "1.0.13", "1.0-2", 
"1.5.0", "1.4.2", "1.2.11", "2.10-1", "1.1.0", "1.0-8", "1.0.3", 
"1.0.2", "1.5.20", "1.0.1", "1.5.0", "1.0.1", "0.0.9", "1.4.7"
)

npacks = length(vers)
stopifnot(length(pks)==npacks)

dir.create("bioc_1.5_src")
for (i in seq_len(npacks)) {
 try(download.file(src_url_1.5(pks[i], vers[i]), destfile=paste0("bioc_1.5_src/", pks[i], "_", vers[i], ".tar.gz")))
}

dir.create("bioc_1.5_win")
for (i in seq_len(npacks)) {
  try(download.file(win_url_1.5(pks[i], vers[i]), destfile=paste0("bioc_1.5_win/", pks[i], "_", vers[i], ".zip")))
}

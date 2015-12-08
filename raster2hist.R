raster2hist<-function(r, levels="discrete", palette=terrain.colors,...){
  mat<-as.numeric(as.matrix(r))
  if(levels[1]=="discrete"){
    fac<-mat[!is.na(mat)]
    tab<-table(fac)
  }else{
    fac<-cut(mat, breaks=levels)
    labs <- levels(fac)
    lower = as.numeric( sub("\\((.+),.*", "\\1", labs) )
    labs<-lower
    tab<-table(fac)
    names(tab)<-labs
  }
  pal<-palette(length(tab))
  bp<-  barplot (tab, col=pal,...)
  return(list(table=tab,barplot.x=bp))
}
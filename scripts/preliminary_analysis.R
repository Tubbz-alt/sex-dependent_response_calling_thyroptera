
sels2 <- read.csv("~/Downloads/M-F song selections - Prelim analysis - TEMP.csv")

out <- pbapply::pblapply(unique(sels2$sound.files), function(x){
  
     # extract data for a single sound file
     X <- sels2[sels2$sound.files == x, ]
    
       # count levels in sex
       cnts <- table(X$sex)
      
         # get sex
         sx <- names(cnts)[which.max(cnts)]
        
           # fix NAs in sex
           X$sex[is.na(X$sex)] <- sx
          
             return(X)
         })


new.sels <- do.call(rbind,out)

anyNA(new.sels$sex)



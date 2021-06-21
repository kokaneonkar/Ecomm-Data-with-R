setwd("C:/Users/onkar.k/Desktop/Datasets")
getwd()
data<-read.csv("EcommData.csv")
View(data)

#Warehouse with highest calls Customer care calls 
ware<-aggregate(data$Customer_care_calls~data$Warehouse_block,FUN=sum)
View(ware)

pie(ware$`data$Customer_care_calls`, labels = ware$`data$Customer_care_calls`,
      main ="Warehouse with highest calls Customer care calls",
      col = rainbow(length(ware$`data$Warehouse_block`)))
      legend("left", c("A Block","B Block","C Block", "D Block","F Block"), cex = 0.9,
      fill = rainbow(length(ware$`data$Warehouse_block`))
    )
      #F block has highest no. of Customer calls. 
###########################

#Warehouse with average Rating
ware1<-table(data$Customer_rating,data$Warehouse_block)
      
View(ware1)
barplot(ware1, main = "Warehouse with average Rating", 
        names.arg = ware$Freq, xlab ="Blocks", ylab = "Ratings" )      
     
#Male vs Female retained customers 

rtn<-table(data$Gender)
View(rtn)
barplot(rtn, ylab="Retaining", main = "Male vs Female retained customers")
text(rtn,paste(rtn,0,sep = ""),cex = 1, pos = 1)

#Shipment mode With most customers calls
shp<-aggregate(data$Customer_care_calls~data$Mode_of_Shipment, FUN = sum)
View(shp)
barplot(shp$`data$Customer_care_calls`, names.arg=shp$`data$Mode_of_Shipment`,
        main = "Shipment mode With most customers calls", 
         xlab ="Mode", ylab = "calls" )

#Who Purchased Imp products
imp<-table(data$Product_importance,data$Gender)

barplot(imp,beside = TRUE, 
        col = c("Red", "skyblue1","skyblue3"), 
        main = "Who Purchased Imp products", 
        width=c(2,3),
        legend.text = rownames(imp),
        args.legend = list(cex=0.5,x = "topleft"))


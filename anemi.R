veri<-read.csv("C:\\Users\\mefis\\Downloads\\output.csv")
for (i in 1:length(veri)){          # eksik veri yoktur.
  print(sum(is.na(veri[[i]])))
}
library(caret)
library(dplyr)
glimpse(veri)#sütunların analizi


veri$Sex<-gsub("F ","F",veri$Sex)#Char dönüşümü
veri$Sex<-gsub("M ","M",veri$Sex)


veri[[2]]<-as.integer(as.factor(veri$Sex))

boxplot(veri[,3:6])



library(corrr)
cor(veri[,3:6])#yüksek korelasyonlar var

for (i in 3:(length(veri))-1){#aykırı veri analizi. medyan ile değiştirildi
  outlier<-boxplot.stats(veri[[i]])$out
  veri[veri[[i]]%in% outlier,i]<-median(veri[[i]])
}
set.seed(123) #rastgelelik
veri<-veri[,2:7]# sıraları veriden çıkardım
div<-createDataPartition(veri$Anaemic,p=0.8,list = FALSE)
veri[,1:5]<-scale(veri[,1:5])# normalizasyon... ortalama 0 standart sapması 1 olacak şekilde
egitim<-veri[div,] # %80
testing<-veri[-div,] # %20

knnmodel<-train(Anaemic ~ . ,     #model eğitimi
                data = egitim,
                method="knn",
                tuneGrid=data.frame(k=7))

tahmin<-predict(knnmodel,testing) #test verimizi modelde işledik
conf_matrix<-table(tahmin,testing$Anaemic) #tabloda doğru yanlış değer analizi. aşağıdaki sütun için gerekli
acc<-sum(diag(conf_matrix))/sum(conf_matrix)#doğruluk hesabı
cat("%",acc*100)
#başka ayarlar da eklenebilir f1 skoru hassasiyet ve duyarlılık gibi







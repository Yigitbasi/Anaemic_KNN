# Anaemic_KNN
Bu R kodu, insanların kırmızı kan hücrelerinin renk bilgilerini kullanarak kansızlık (anemi) olup olmadığını tahmin etmek için bir makine öğrenmesi modeli oluşturmayı amaçlamaktadır.
Kod şu adımları içerir:

Veri Yükleme ve Hazırlık: output.csv dosyasından kırmızı, yeşil, mavi piksel değerlerini, hemoglobin seviyelerini ve kişilerin kansızlık durumlarını içeren bir veri seti yüklenir. Veri, analiz için temizlenir ve düzenlenir. Cinsiyet gibi kategorik değişkenler sayısal değerlere dönüştürülür ve aykırı değerler ele alınır.

Keşifsel Veri Analizi: Veri setindeki değişkenler arasındaki ilişkileri anlamak için temel istatistikler ve görselleştirmeler kullanılır. Örneğin, piksel değerleri ve hemoglobin seviyeleri arasındaki korelasyon incelenir.

Model Oluşturma: Veri seti, modeli eğitmek için kullanılan bir eğitim kümesi ve modelin performansını değerlendirmek için kullanılan bir test kümesi olmak üzere ikiye ayrılır. K-En Yakın Komşu (KNN) algoritması, kansızlığı tahmin etmek için bir model oluşturmak üzere kullanılır.

Model Değerlendirmesi: Eğitilen KNN modeli, test verileri üzerinde değerlendirilir ve doğruluğu hesaplanır.

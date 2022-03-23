# Genome
<p>This code compares the theoretical and practical length distributions of fragments.</p>

<h1>TR</h1>

<p>“NC_001416” kodlu “bacteriophage lambda” isimli canlının genomu getgenbank() fonksiyonuyla çekildi ve “genom” değişkenine atandı.
Length() fonksiyonuyla “genom” değişkeninin içerdiği char sayısı “genom_uzunlugu” değişkenine atandı.<p>
<p>Baz dizilimini fragmanlara ayıracak olan HpaII isimli “CCGG” dizilimli enzim tanımlandı.</p>
<p>Count() fonksiyonuyla canlının genomu üzerindeki “C” ve “G” bazlarının sayıları hesaplandı. Bu sayıların “genom_uzunlugu”na bölünmesiyle sitozin ve guanin bazlarının frekansları elde edildi. [P(C) ve P(G)]</p>
<p>HpaII enziminin baz dizilimi bağımsız olduğu için canlının genomu üzerinden hesapladığımız sitozin ve guanin bazlarının frekanslarının çarpımıyla HpaII enziminin olasılık değeri [P(CCGG)] hesaplandı ve bu değer Poisson formülünde kullanılmak üzere “lambda” değişkenine atandı.</p>
<p>Fragmanların uzunluklarının olasılığının hesaplandığı Poisson formülünde kullanılacak olan (x’e göre türevlenmiş) fonksiyon “fonksiyon” isimli değişkene atandı.</p>
<p>Strfind() fonksiyonuyla canlı genomunun içerisinde HpaII enziminin baz diziliminin bulunduğu kısımların yani Restriction Site (RS)’ların başlangıç indisleri “RS_index” değişkenine atandı.</p>
<p>Genomun HpaII enzimiyle fragmanlara ayrılması sonucu oluşacak fragman sayısı, genom üzerinde bulunan RS sayısından bir fazla olacak şekilde “fragman_sayisi” değişkenine atandı.</p>
<p>Her bir fragmanın baz diziliminin tutulacağı “fragman” değişkeni, cell() fonksiyonuyla 1 satırlı ve fragman_sayisi sütunlu olacak şekilde oluşturuldu.</p>
<p>İlk fragmanın baz dizilimi, genomun ilk indisinden “RS_index(1)-1” indisine kadar olacak şekilde “fragman(1)”e atandı.</p>
<p>For döngüsü kullanılarak son fragman hariç diğer fragmanlar da fragman(i) değişkenine yerleştirildi. Bu işlem için i = 2 : (fragman_sayisi-1) belirlendi.</p>
<p>Genom üzerinde başlangıç indisi “RS_index(i-1)” ve bitiş indisi “RS_index(i)-1” olan fragmanlar, fragman(i) değişkenine yerleştirildi.</p>
<p>Son fragmanın da başlangıç ve bitiş indisleri “RS_index(end) : end” olacak şekilde fragman(end) kısmına yerleştirildi.</p>
<p>Böylelikle HpaII enzimiyle fragmanlara ayrılan genomun, her bir fragmanının baz dizilimi, “fragman” değişkeninin hücrelerinde tutulur hale geldi.</p>
<p>Teorik olarak kaç adet fragmanın hangi uzunluğa düşeceğinin tutulacağı “beklenen_dagilim” değişkeni zeros() fonksiyonu kullanılarak 1 satırlı ve 7 sütunlu olacak şekilde sıfırlarla dolduruldu.</p>
<p>Not: Fragmanlar, 7 adet uzunluk aralığına dağıtılacağı için 7 sütun belirlendi.</p>
<p>[0,100),[100,200),[200,300),[300,400),[400,500),[500,600),[600,48502)</p>
<p>Fragmanların integralde belirtilen sınır aralığında baz içermesi ihtimali, integral() fonksiyonu ile “fonksiyon” değişkeninin belirli integrali alınarak hesaplandı. (Poisson dağılımı)</p>
<p>Her bir aralık için hesaplanan teorik olasılık değerleri, toplam fragman sayısı ile çarpılarak ilgili aralığa düşen fragman sayısı hesaplandı. Bu değerler “beklenen_dagilim(i)” değişkenine atandı.</p>
<p>Fragmanların gözlenen uzunluklarının depolanması için zeros() fonksiyonuyla 1 satırlı 7 sütunlu “gozlenen_dagilim” değişkeni oluşturuldu.</p>
<p>For döngüsüyle her bir fragmanın uzunluğunun hangi aralığa düştüğünün kontrolü yapıldı. Bu işlem için if, elseif, else yapısı kullanıldı. <br>
[0,100) aralığı için gozlenen_dagilim(1), <br>
[100,200) aralığı için gozlenen_dagilim(2), <br>
[200,300) aralığı için gozlenen_dagilim(3), <br>
[300,400) aralığı için gozlenen_dagilim(4), <br>
[400,500) aralığı için gozlenen_dagilim(5), <br>
[500,600) aralığı için gozlenen_dagilim(6), <br>
[600,48502) aralığı için gozlenen_dagilim(7) değerleri bir arttırıldı.</p>
<p>Her bir aralık için beklenen ve gözlenen dağılımlardan yararlanılarak yapılacak olan ki-kare hesaplarının tutulması için zeros() fonksiyonuyla “ki_kare” değişkeni oluşturuldu.</p>
<p>“beklenen_dagilim(i) - gozlenen_dagilim(i)” değerinin karesinin “beklenen_dagilim(i)” değerine bölünmesiyle elde edilen ki-kare değerleri for döngüsüyle “ki_kare” değişkenine atandı.</p>
<p>Hesaplanan ki-kare değerlerinin toplamı da “sonuc” değişkenine atandı.</p>
<p>Sonuç = 154,4658 <br>
6.Dereceden Ki-Kare = 12,592 (0.05 için)</p>

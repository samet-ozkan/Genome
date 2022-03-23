% Bacteriophage Lambda canlısının genomu çekilir.
genom = getgenbank('NC_001416','SequenceOnly',true);
genom_uzunlugu = length(genom);
 
% Genomu fragmanlara ayıracak olan HpaII enziminin frekansı, baz dizilimindeki bazların frekanslarının çarpımıdır.
HpaII = 'CCGG';
c_frekansi = count(genom,'C')/genom_uzunlugu;
g_frekansi = count(genom,'G')/genom_uzunlugu;
lambda = power(c_frekansi,2)*power(g_frekansi,2);
 
% Poisson dağılım formülünde integrali alınacak olan fonksiyon.
fonksiyon = @(x) lambda*exp(-lambda*x);
 
% Restriction Siteların başlangıç indisleri tutulur.
RS_index = strfind(genom,HpaII);
 
% Enzimin genomu ayırmasıyla oluşan fragmanların sayısı, RS sayısının bir fazlasıdır.
fragman_sayisi = length(RS_index) + 1;
fragman = cell(1,fragman_sayisi);
 
% Fragmanların baz dizilimleri fragman değişkenine atanır.
fragman(1) = {genom(1:(RS_index(1)-1))};
for i = 2:(fragman_sayisi-1)
    fragman(i)={genom(RS_index(i-1):RS_index(i)-1)};
end

fragman(end) = {genom(RS_index(end):end)};
 
% Poisson dağılım formülüyle uzunluk olasılıkları bulunur.
% Bu olasılıkların her biri toplam fragman sayısıyla çarpılır ve beklenen dağılım hesaplanır.
beklenen_dagilim = zeros(1,7);
for i = 1:6
    beklenen_dagilim(i) = integral(fonksiyon,100*(i-1),100*(i))*fragman_sayisi;
end
beklenen_dagilim(end) = integral(fonksiyon,600,genom_uzunlugu)*fragman_sayisi;
 
% Her bir fragmanın uzunluğu hesaplanır ve bulunduğu aralığı ifade eden değer bir arttırılır.
gozlenen_dagilim = zeros(1,7);
for i = 1:fragman_sayisi
	if (length(fragman{i}) >= 0) && (length(fragman{i}) < 100)
        gozlenen_dagilim(1) = gozlenen_dagilim(1) + 1;
	
	elseif (length(fragman{i}) >= 100) && (length(fragman{i}) < 200)
        gozlenen_dagilim(2) = gozlenen_dagilim(2) + 1;
	
	elseif (length(fragman{i}) >= 200) && (length(fragman{i}) < 300)
        gozlenen_dagilim(3) = gozlenen_dagilim(3) + 1;
	
	elseif (length(fragman{i}) >= 300) && (length(fragman{i}) < 400)
        gozlenen_dagilim(4) = gozlenen_dagilim(4) + 1;
	
	elseif (length(fragman{i}) >= 400) && (length(fragman{i}) < 500)
        gozlenen_dagilim(5) = gozlenen_dagilim(5) + 1;
	
	elseif (length(fragman{i}) >= 500) && (length(fragman{i}) < 600)
        gozlenen_dagilim(6) = gozlenen_dagilim(6) + 1;
	
	else
        gozlenen_dagilim(7) = gozlenen_dagilim(7) + 1;
	end
end
 
% Beklenen ve gözlenen dağılım değerleri ile ki-kare hesabı yapılır.
% Aralıkların ki-kare değerlerinin toplamı sonuc değişkenine atanır.
ki_kare = zeros(1,7);
sonuc = 0;
for i = 1:7
	ki_kare(i) = power((beklenen_dagilim(i)-gozlenen_dagilim(i)),2)/beklenen_dagilim(i);
	sonuc = sonuc + ki_kare(i);
end

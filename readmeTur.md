###### Not: Bu yazılan kodlar Numerical Analysis (Richard L. Burden, J. Douglas Faires etc.) kitabında bulunan LU Factorization başlığı altındaki algoritmadan yararlanılarak yazılmıştır.

# LU Faktorizasyonu
LU faktorizasyonu, bir kare matrisin (A) iki üçgensel matrisin (L ve U) çarpımına ayrılması işlemidir. Bu işlem, çeşitli lineer cebir problemlerinin çözümünde kullanılır ve aşağıdaki şekilde ifade edilir:

A = LU

Burada:
* L, alt üçgensel bir matristir ve tüm elemanları esas köşegenin altında yer alır, köşegen elemanları 1'dir.
* U, üst üçgensel bir matristir ve tüm elemanları esas köşegenin üstünde yer alır.

LU faktorizasyonu, matris çözümlemesi, determinant hesaplama ve ters matris bulma gibi işlemler için oldukça kullanışlıdır.

## LU Faktorizasyonunun Kullanımı
LU faktorizasyonu, lineer denklemler sistemini çözmek için şu şekilde kullanılır:

* İlk Adım: LU faktorizasyonunu kullanarak A matrisini L ve U matrislerine ayırılır.
A=LU

* İkinci Adım: AX=B şeklindeki bir lineer denklemler sistemini çözmek için, önce ara bir değişken (Y) kullanarak LY=B denklemini çözün.
LY=B

* Üçüncü Adım: Elde edilen Y değerini kullanarak UX=Y denklemini çözün.
UX=Y

Bu adımlar sonucunda X çözümü elde edilmiş olur.

##### Kitaptaki Alıştırmalar

A = [[1,2,-1],[2,4,0],[0,1,-1]]
B = [[0,1,1],[1,-2,-1],[1,-1,1]]
C = [[1,1,-1,0],[1,1,4,3],[2,-1,2,4],[2,-1,2,3]]

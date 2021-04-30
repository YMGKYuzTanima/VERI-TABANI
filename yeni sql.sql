create table firma (
firma_ID smallint primary key,
firma_ismi nvarchar(50),
firma_tel nvarchar(10),
firma_mail nvarchar(100)

)
create table oda (
oda_ID int  primary key,
oda_konum_mesafe smallint,
oda_yol_haritasý nvarchar(max)
)
create table personel (
personel_ID int  primary key,
kullanýcý_ADI nvarchar(50),
kullanýcý_sifre nvarchar(20),
kimlik_numarasý nvarchar(11),
firma_ID smallint foreign key references firma(firma_ID),
isim nvarchar(30),
soyisim nvarchar(30),
mail nvarchar(50),
adres nvarchar(100),
telefon nvarchar(12),
birimi tinyint ,
giris_saat smalldatetime,
cikis_saat smalldatetime,
ziyaret_saatleri smalldatetime,
maas smallint,
mesai tinyint,
oda_ID int foreign key references oda(oda_ID)
)
create table rapor(
personel_ID int foreign key references personel(personel_ID),
giris_saat smalldatetime ,
cýkýs_saat smalldatetime ,
oda_ID int foreign key references oda(oda_ID)
)
create table kamera(
kamera_IP nvarchar(40) primary key,
personel_ID int foreign key references personel(personel_ID),
firma_ID smallint foreign key references firma(firma_ID),
kamera_konum_isimlendirme nvarchar(50)
)

create table ziyaretci(
ziyaretci_ID smallint primary key ,
ziyaretci_kimlik_nu nvarchar(11),
firma_ID smallint foreign key references firma(firma_ID),
isim nvarchar(30),
soyisim nvarchar(30),
mail nvarchar(50),
adres nvarchar(50),
ziyaretci_telefon nvarchar(10),
personel_ID int foreign key references personel(personel_ID),
ziyaret_sebebi nvarchar(50),
ziyaret_saati smalldatetime,
ziyaret_durum bit
)
create table ziyaretci_raporu(
ziyaretci_ID smallint foreign key references ziyaretci(ziyaretci_ID),
son_konumu char,
kamera_görüs_saati smalldatetime,
ihlal bit 
)
create table personel_birim(
birim_ID smallint primary key,
birimi nvarchar(30)
)
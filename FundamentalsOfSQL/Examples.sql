

SELECT U.USERNAME_    AS KULLANICIADI
     , U.NAMESURNAME  AS ADSOYAD
	 , CT.CITY        AS IL
	 , T.TOWN         AS ILCE
	 , D.DISTRICT     AS SEMT
	 , A.ADDRESSTEXT  AS ADRES
	 , O.ID           AS SIPARISID
	 , O.DATE_        AS TARIH
	 , O.TOTALPRICE   AS TOPLAMTUTAR
	 , P.DATE_        AS ODEMETARIHI
	 , P.APPROVECODE  AS BANKAONAYKODU
	 , I.DATE_        AS FATURATARIHI
	 , I.CARGOFICHENO AS KARGOFISNO
	 , ITM.ITEMCODE   AS URUNKODU
	 , ITM.ITEMNAME   AS URUNADI
	 , OD.AMOUNT      AS MIKTAR
	 , OD.UNITPRICE   AS BIRIMFIYAT
	 , OD.LINETOTAL   AS SATIRTOPLAMI 
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
WHERE U.NAMESURNAME='Aysel BAKAR'


--�EH�RLERE G�RE TOPLAM VER�LEN S�PAR�� M�KTARI

SELECT CT.CITY AS SEHIRADI
      ,SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI
	  ,SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_ADET
	  ,COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
GROUP BY CT.CITY
ORDER BY 2 DESC

--�R�N KATEGOR�LER�NE G�RE DA�ILIM

SELECT ITM.CATEGORY1 
      ,ITM.CATEGORY2
      ,SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI
	  ,SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_ADET
	  ,COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
WHERE ITM.CATEGORY1 = 'EV'
GROUP BY ITM.CATEGORY1,ITM.CATEGORY2
ORDER BY 3 DESC

SELECT ITM.CATEGORY1 
      ,ITM.CATEGORY2
	  ,ITM.CATEGORY3
      ,SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI
	  ,SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_ADET
	  ,COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI
	  ,SUM(OD.LINETOTAL)/SUM(OD.AMOUNT) AS ORTALAMAFIYAT
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
WHERE ITM.CATEGORY1 = 'KOZMETIK'
GROUP BY ITM.CATEGORY1,ITM.CATEGORY2,ITM.CATEGORY3
ORDER BY 4 DESC

SELECT ITM.CATEGORY1 
      ,ITM.CATEGORY2
      ,SUM(OD.LINETOTAL) AS TOPLAMSIPARIS_TUTARI
	  ,SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_ADET
	  ,COUNT(OD.ID) AS TOPLAMSIPARIS_SAYISI
	  ,SUM(OD.LINETOTAL)/SUM(OD.AMOUNT) AS ORTALAMAFIYAT
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
GROUP BY ITM.CATEGORY1,ITM.CATEGORY2
ORDER BY 6 DESC

--TAR�HE G�RE S�PAR�� DA�ILIMI--
SELECT	CONVERT(DATE,O.DATE_) TARIH 
	  , SUM(OD.LINETOTAL) AS TOPLAMSIPARIS
	  , SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_TUTAR
	  , SUM(OD.ID)        AS TOPLAMSIPARIS_SAYISI
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
GROUP BY CONVERT(DATE,O.DATE_) 
ORDER BY TARIH

--AYLARA G�RE S�PAR�� DA�ILII
SELECT	DATEPART(YEAR,O.DATE_) YIL,
	  	DATEPART(MONTH,O.DATE_) AY,
	    CASE 
			WHEN DATEPART(YEAR,O.DATE_)=1  THEN 'OCAK'
			WHEN DATEPART(YEAR,O.DATE_)=2  THEN 'SUBAT'
			WHEN DATEPART(YEAR,O.DATE_)=3  THEN 'MART'
			WHEN DATEPART(YEAR,O.DATE_)=4  THEN 'NISAN'
			WHEN DATEPART(YEAR,O.DATE_)=5  THEN 'MAYIS'
			WHEN DATEPART(YEAR,O.DATE_)=6  THEN 'HAZIRAN'
			WHEN DATEPART(YEAR,O.DATE_)=7  THEN 'TEMMUZ'
			WHEN DATEPART(YEAR,O.DATE_)=8  THEN 'AGUSTOS'
			WHEN DATEPART(YEAR,O.DATE_)=9  THEN 'EYLUL'
			WHEN DATEPART(YEAR,O.DATE_)=10 THEN 'EKIM'
			WHEN DATEPART(YEAR,O.DATE_)=11 THEN 'KASIM'
			WHEN DATEPART(YEAR,O.DATE_)=12 THEN 'ARALIK' 
		END AS AYADI ,
	  
	    SUM(OD.LINETOTAL) AS TOPLAMSIPARIS ,
	    SUM(OD.AMOUNT)    AS TOPLAMSIPARIS_TUTAR ,
	    SUM(OD.ID)        AS TOPLAMSIPARIS_SAYISI 
FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID = O.ID
	INNER JOIN  ITEMS      ITM ON ITM.ID     = OD.ITEMID
GROUP BY DATEPART(YEAR,O.DATE_),DATEPART(MONTH,O.DATE_)
ORDER BY DATEPART(YEAR,O.DATE_),DATEPART(MONTH,O.DATE_)


--�DEME T�R�NE G�RE DA�ILIM

SELECT
DATEPART(YEAR,DATE_) AS YIL ,
DATEPART(MONTH,DATE_) AS AY ,
CASE 
	WHEN PAYMENTTYPE=1 THEN 'KRED� KARTI'
	WHEN PAYMENTTYPE=2 THEN 'BANKA HAVALES�'
END AS ODEMETURU_ACIKLAMA
     , SUM(PAYMENTTOTAL) AS TOPLAMTUTAR
FROM PAYMENTS
GROUP BY DATEPART(MONTH,DATE_),DATEPART(YEAR,DATE_),PAYMENTTYPE
ORDER BY DATEPART(MONTH,DATE_),DATEPART(YEAR,DATE_)

--ORTALAMA TESL�MAT S�RES�
SELECT-- O.ID                           AS SIPARISID
	 -- ,O.DATE_                        AS SIPARISTARIHI
   --   ,I.DATE_                        AS FATURATARIHI
	  AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS TESLIMATSURESI_SAAT ,
	  MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_))  ENKISA_TESLIMATSURESI,
	  MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_))  ENUZUN_TESLIMATSURESI

FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID

	SELECT DATEDIFF(MINUTE,'2019-02-05 23:56:58.000','2019-02-06 10:54:58.000')

SELECT U.ID , U.NAMESURNAME ,
		AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_))  ORTALAMATESL�MAT_SURESI ,
	    MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_))  ENKISA_TESLIMATSURESI,
		 MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_))  ENUZUN_TESLIMATSURESI,
		SUM(O.TOTALPRICE)  TOPLAMSIPARIS_TUTAR ,
		COUNT(O.ID) SIPARISSAYISI

FROM ORDERS O
	INNER JOIN USERS         U ON U.ID       = O.USERID
	INNER JOIN ADDRESS       A ON A.ID       = O.ADDRESSID
	INNER JOIN CITIES       CT ON CT.ID      = A.CITYID
	INNER JOIN TOWNS         T ON T.ID       = A.TOWNID
	INNER JOIN DISTRICTS     D ON D.ID       = A.DISTRICTID
	INNER JOIN PAYMENTS      P ON P.ORDERID  = O.ID
	INNER JOIN INVOICES      I ON I.ORDERID  = O.ID

	GROUP BY  U.ID , U.NAMESURNAME 
	HAVING AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) > 30

	ORDER BY 6 DESC




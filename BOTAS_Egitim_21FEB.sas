proc print data=sashelp.class;
run;

data work.yeniveri;
 set sashelp.shoes;
 yenidegisken=Sales-Returns;
run;

/* How to assign a new library */


 libname  BOTAS "/home/tansu.tosun0/BOTAS" ;
 
 data BOTAS.shoes;
 set sashelp.shoes;
 Netsatis=Sales-Returns;
run;

/* Output 1 : Data Table */
/* Output 2 : Data View */
/* Output 3 : Reporting */

proc delete data=BOTAS.shoes; run;

proc sql;  drop table work.BOTAS_FO; quit;
proc sql;  drop table BOTAS.BOTAS_FO; quit;

proc sql;  drop table BOTAS.SHOES; quit;

/* tanimlayici Kisim */

proc contents data=botas.shoes ; run;

/* Variable Naming */

/* MAX 32 Char , No Space, No TR Chars, AlphaNUmeric + "_" + No Case Sensitive */

/* SAS Date Values */

daat tarih;
 degisken="20Jan2025"d ;
 format degisken date9. ;
run;


/* Siralama Calismasi */

proc sort data=BOTAS.SHOES out=work.shoes2;
 by Product descending Sales;
run;

/* BAslik ve Dipnot */


title "Sınıfın katılım listesi" ;
footnote "Sınıfta olan tüm öğrencileri gösterir" ;
proc print data=sashelp.class label;
 label Name="Kişinin ismini gösterir" ;
run;

title;
footnote;

proc format;
 value $gender 'M'='Male' 'F'='FEMALE' ; run;

proc print data=sashelp.class label;
 label Name="Kişinin ismini gösterir" ;
 format Sex $gender. ;
run;

/* Yeni bir Veri Seti Olusturma */

data work.yeniveri;
 set sashelp.shoes;
 yenidegisken=Sales-Returns;
run;

proc import datafile="/home/tansu.tosun0/email.csv" dbms=dlm out=WORK.email replace; delimiter=";" ;
getnames=YES ; 
run;

/* Print , Means , Univariate , Freq */

proc print data=sashelp.cars (obs=10);
 var Make Model MSRP;  run;
 
proc means data=sashelp.cars;
 var EngineSize Horsepower MPG_City MPG_Highway;
run;

proc Univariate data=sashelp.cars;
 var EngineSize ;
run;

proc freq data=sashelp.cars;
 tables  Origin Type;
run;

proc print data=sashelp.cars ;
 var Make Model MSRP;  
 where Type="SUV" and MSRP>=40000;
run;

proc means data=sashelp.cars;
 var EngineSize Horsepower MPG_City MPG_Highway MSRP;
 *where Type="SUV" and MSRP>=40000;
 *where MSRP between 40000 and 60000 ;
 where Make like "H%" ;
run;

/* Where Conditions */

where MSRP between 40000 and 60000 ;

/* Veriyi Siralamak */

Proc sort data=sashelp.cars out=tested_cars ; by MSRP ; run;

/* Drop Keep Function */

data yeniveri;
set sashelp.class;
keep Name Age Height;
*drop Sex Weight;
run;

data yeniveri;
set sashelp.class(keep=Name Age Height);
run;

/* Ifadeler */

data cars2;
 set sashelp.cars;
 where Origin ne "USA";
 Profit=MSRP-Invoice;
 Source="Non-US Cars" ;
 format profit dollar10. ;
 keep Make Model MSRP Invoice Profit Source ;
run;

/* Numeric Functions */

data cars3;
 set sashelp.cars;
 MPG_Mean=mean(MPG_City,MPG_Highway);
 MPG_Mean=max(MPG_City,MPG_Highway);
run;

/* Char Functions */

data cars4;
 set sashelp.cars;
 Make2=upcase(Make);
 Make3=lowcase(Make);
 Make4=propcase(Make);
run;

/* Catx Function */
/* Substr */

/* Title Footnote Ekleme */

proc print data=sashelp.cars;
 title1 'İlk Baslik' ;
 title2 'İkinci Baslik';
run;

proc print data=sashelp.cars;
 title3 'Ucuncu  Baslik' ;
 footnote "Rapor X Departman için hazırlanmıştır" ;
run;

proc format;
 value gender 1='Female' 2='Male' other='Yanlis' ;
 value ucret low-50000='50 Binden Az' 50000-100000='Orta Seviye' 100000-high='Çok yüksek' ;
 value $kod 'BMW'='AracSegment1' 'Skoda'='AracSegment2';
run;

proc print data=sashelp.cars;
 format cinsiyet $gender. ;
run;

/* SAS Data Step Programming */

data work.sonuc;
 set work.import1;
 Toplam1=FirstClass+Economy;
 Toplam2=sum(FirstClass,Economy);
run;

/*Exercise 10.45 */

/*Import datasını kullanın 
Yil, ÇEyrek, Ay, Gun bilgisi içeren kolonlar + Bugun tarihini gösteren birkolon */

data work.yeniveri1;
 set work.import1;
 yil=year(Date);
 Quarter=QTR(Date);
 Ay=Month(Date);
 Gun=Day(Date);
 Bugun=today();
 format Bugun date9. ; 
 ToplamMusteri=sum(FirstClass,Economy);
 drop FirstClass Economy;
run;


data work.yeniveri2;
 set work.import1(drop=FirstClass Economy);
 yil=year(Date);
 Quarter=QTR(Date);
 Ay=Month(Date);
 Gun=Day(Date);
 Bugun=today();
 format Bugun date9. ; 
 ToplamMusteri=sum(FirstClass,Economy);
run;

/* GeLir Degiskeni Hesaplama

LA First Class 1000$ Eco 500$
DFW First Class 750$ Eco 500$ */

data work.gelir;
	set work.import1;
	IF upcase(Dest)="LAX" then Gelir= sum(firstclass*1000,economy*500);
	else if upcase(Dest)="DFW" then Gelir= sum(firstclass*750,economy*500);
	format Gelir dollar9.;
run;

data work.gelir;
	set work.import1;
	IF upcase(Dest)="LAX" then Gelir= sum(firstclass*1000,economy*500);
	if upcase(Dest)="DFW" then Gelir= sum(firstclass*750,economy*500);
	format Gelir dollar9.;
run;

/* 11.35 */

/* Appending */

data Data1A;
set SAShelp.Cars;
 keep Make Model Origin MSRP DriveTrain ;
 if Origin="Europe" ;
run;

data Data1B;
set SAShelp.Cars;
 keep  Make Model Invoice Horsepower ;
 if Origin="Europe" ;
run;

proc sort data=Data1A; by Model; run;
proc sort data=Data1B; by Model; run;
data DAta1C;
 merge Data1A Data1B;
 by Model;
run;

/*************************************************************************************/

sort by FlightID

where Date='15dec1999'd and Origin='BHM';

sortb 
;

data sortb;
 set BOTAS.target121999;
 if Date='15dec1999'd and Origin='BHM';
run;

proc sort data=sortb;
 by FlightID;
run;

data sorts;
 set BOTAS.sales121999;
 if Date='15dec1999'd and Origin='BHM';
run;

proc sort data=sorts;
 by FlightID;
run;

/* Compare data set */

( LostCargoREv = CargoTarRev - CargoRev);

data compare ;
 merge sortb sorts ;
 by FlightID;
 LostCargoREv = CargoTarRev - CargoRev;
 format LostCargoREv dollar10.2 ; 
 label LostCargoREv="Lost Cargo Revenue" ;
run;

/*****/

* File = Dataset = Table 
* Record = Observation = Row
* Field = Variable = Column

/*****/;

data original_data;
    input Lname $ Grade ;
    datalines;
SMITH 0.90
JONES 0.57
MOORE 0.85
LEE 0.98
LONG 0.67
GREEN 0.70
FOREMAN 0.69
;
run;

data result_data; 
 length Status $10. ;  
 set original_data;
 if Grade > 0.70 then Status = 'PASS A';
 else if Grade > 0.90 then Status = 'PASS A+';
 else Status = 'Failed';
 drop Grade;
run;
 
/*Growth */

data forecast;
 set BOTAS.growth;
 Year=1;
 NUmemps_FC=NUmemps*(1+Increase);
 output;
 Year=2;
 NUmemps_FC=NUmemps_FC*(1+Increase);
 output;
 Year=3;
 NUmemps_FC=NUmemps_FC*(1+Increase);
 output;
run;

data forecast;
 set BOTAS.growth;
 do Year=1 to 3;
 NUmemps_FC=NUmemps*((1+Increase)**Year);
 output;
 end;
run;

/* 11.45 */

/* Military verisinde her bir type için bir veriseti oluşturun */

data airforce Army Naval Marine;
 set BOTAS.military;
 if Type='Air Force' then output airforce;
 else if Type='Army' then output Army ;
 else if Type='Naval' then output Naval ;
 else if Type='Marine' then output Marine ;
run;

data airforce(drop=Type) Army Navy Marine;
 set BOTAS.military(obs=100);
 select (Type) ;
  when ('Air Force') output airforce;
  when ('Army') output Army;
  when ('Naval') output Navy;
  when ('Marine') output Marine;
  otherwise;
 end;
run;

/*Accumulating Totals*/
/*162*/

data botas.daysales2;
	set botas.daysales;
	format SaleDate Date9.;
run;


data compare;
 merge Botas.goals Botas.performance;
 by MOnth;
 Kar_Zarar=Goal-Sales;
run;

proc sort data=compare;
 by Kar_Zarar;
run;

data compare;
 set compare;
 if _N_=1 then Status="Low PErformance";
run;

proc sort data=compare;
 by descending Kar_Zarar ;
run;

data compare;
 set compare;
 if _N_=1 then Status="High PErformance";
run;

data compare2;
 set compare;
 if Status ne ' ' ;
run;

proc print data=compare2; run;

/***** 12 Subat ******/

data rotate(drop=Qtr1 Qtr2 Qtr3 Qtr4) ;
 set botas.donate;
 Qtr=1;
 Miktar=Qtr1;
 output;
 Qtr=2;
 Miktar=Qtr2;
 output;
 Qtr=3;
 Miktar=Qtr3;
 output;
 Qtr=4;
 Miktar=Qtr4;
 output;
run;


data botas.ffmethod2  (drop= Internet Telephone TravelAgency)  ;
	set botas.ffmethod;
	
	if TravelAgency='Y' then 
	do ; 
	 Method="TravelAgency";
     output;
	end;

	if Telephone='Y' then do ; 
	 Method="Telephone";
	 output;
    end; 
    
	if Internet='Y' then do ; 
	 Method="Internet";
	 output;
	end;
run;

%macro dongu;
 data rotate2(drop=Qtr1 Qtr2 Qtr3 Qtr4 i) ;
 set botas.donate;
 %do i=1 %to 4 ;
  Qtr=&i ;
  Miktar=Qtr&i.;
  output;
 %end;
run;
%mend;
%dongu;

data mnthtot;
 set Botas.daysales;
 retain Aytoplam 0;
 Aytoplam=Aytoplam + SaleAmt;
run;


/*
2 degisken eklenecek. 

TotArea
NumofStates


STATES Veriseti

work.usarea 

State Enterdate Size TotArea NumStates
*/

proc sort data=botas.states; by Enterdate; run;

data work.usarea;
 set botas.states;
 TotArea+Size;
 NumStates+1;
run;

/* First ve Last */

data fiyat(drop=Invoice);
 set sashelp.cars(keep=Make Invoice);
 by Make;
 if First.Make then Toplamfiyat=0;
 ToplamFiyat+Invoice;
 if Last.Make then output;
run;


proc sort data=botas.flymiles; by id ; run;

data toplam(drop=miles);
 set botas.flymiles;
 by id;
 if First.id then toplammil=0;
  toplammil+Miles;
 if Last.id then output;
run;

/*************************************************************************/
/* Substr */

data labels ;
 retain ID2 ;
 set botas.freqflyers;
 if substr(right(ID),6,1)='1' then Title='Ms.' ;
 else if substr(right(ID),6,1)='2' then Title='Mr.' ;
run;

/* Scan */

data tarama;
 Metin='Carsamba Subat 12,2025';
 Hgunu=scan(Metin,1,' ');
 Ay=scan(Metin,2,' ');
 Gun=scan(scan(Metin,3,' '),1,',');
 yil=scan(scan(Metin,3,' '),2,',');
run;
proc print data=tarama; run;

/* Concat */

data tarama2;
 set botas.freqflyers;
 Butunisim=catx(' ',scan(Name,2,','),scan(Name,1,','));
run;
proc print data=tarama2; run;

/* Find */

data index_;
 Text='DELIMIT IT WITH BLANKS';
 Pos1=find(Text,'IT');
 Pos2=find(Text,' IT');
 Pos3=find(Text,'it');
 Pos4=find(Text,'it','I');
run;

proc print data=index_ ; run;

/* Silver geçen kayıtları bulunuz */

/* FFHistory verisi üzerinden */

data icerik;
	set botas.ffhistory;
	Pos1=find(Status,'silver','i');
run;

/* Upcase */

/* Tranwrd */

data work.yeni;
 set botas.ffhistory;
 Status=tranwrd(status,'silver','Silver');
run;

/* lowcase, Upcase */
/* Substr */

/* Manipulating Numerical Functions */

/* Truncation Functions */

/* Round, Ceil, Floor, int */

data truncate;
 newVar1=round(12.12);
 NewVar2=round(42.65,.1);
 NewVar3=round(42.678,.01);
 NewVar4=round(42.678,10);
 
 Ceil1=ceil(42.678);
 Floor1=floor(42.678);
 
 int1=int(42.678);
run;
proc print data=work.truncate; run;

/* Sum, Mean, Min, Max */

data summary;
 Var1=12;
 Var2=. ;
 Var3=6;
 Yenideg=sum(Var1,Var2,Var3);
 Yenideg2=Var1+Var2+Var3;
 Yenideg3=sum(of Var1-Var3);
 
 Yenideg4=mean(Var1,Var2,Var3);
run;
proc print data=work.summary; run;


/* Grade >> Final */
/* Overall=Final 2 akt, diğer notlar 1 kat ağırlıkta */

/* Overall Skorun olduğu verisetini yaratınız : Overall ondalıklı görünmeyecek */

data finalnotu;
set botas.grade;
overall=int(mean(of Test1-Test3,Final,Final));
run;
proc print data=work.finalnotu; run;

/* EvÖdevi 1 14 SUBAT: En yüksek 2 notun ortalamasının alındığı Geç me notu hesaplanacak */
/* Grade veriseti */

/* Tarih verisi transformasyonu */

/* MDY Function */

data tarih;
 _m=month(today());
 _g=day(today());
 _y=year(today());
 buguntarih=mdy(_m,_g,_y);
 format buguntarih date9. ;
 
 qtr_=QTR(buguntarih);
 weekday_=weekday(buguntarih);
run;
proc print data=work.tarih; run;

/* İse baglangic tarihini ve kaç yıldır çalıştığını gösteren verisetini yaratın , gun olarak ayın 15i diyelim. */

/* Noday verisini kullanıp*/

data calisma;
	set botas.noday;
	gun=mdy(HiredMonth,15,HiredYear);
	format gun date9.;
	sure1=(today()-gun);
	sure2=intck('year',gun, today());
run;
proc print data=calisma;run;

/* 11.45 */

/* Input function , Put function */

data bonus;
 set botas.salary1;
  Bonus=.10*GrossPay;
run;

data cevrim;
 CVar1='32000';
 CVar2='32,000';
 Cvar3='14FEB2025';
 CVar4='010308';
 
 NVar1=input(CVar1,5.);
 NVar2=input(CVar2,comma6.);
 NVar3=input(CVar3,date9.);
 NVAr4=input(CVar4,mmddyy6.);
 
 NVar5=45960;
 CVar5=put(NVar5,8.);
 
run;

/* Do Loop */

data faiz(drop=i);
 Amount=50000;
 Oran=0.075;
 Yearly=Amount*Oran;
 do i=1 to 4;
  Quarterly+((Quarterly+Amount)*Oran/4);
 end;
run;

/* Farkli Do Donguleri */

 do Ay='Ocak','Subat','Mart' ;
 
 do Ay=Ay1-Ay50 ;
 
/* EV Ödevi 2: Her ay 5000  lira yatırın .Her ay da %7.5 faiz getirsin. Önünüzdeki 120 ay için her ay ne akdar getiri 
elde edriz. Bunu hesaplayan vegösteren SAS Döngüsünü yazınız. */

/* Dizeler : SAS Array Processing  */

data charity;
 set botas.donate;
 Qtr1=Qtr1*1.25;
 Qtr2=Qtr2*1.25;
 Qtr3=Qtr3*1.25;
 Qtr4=Qtr4*1.25;
run;

data yatirim;
 do while(Capital le 1000000)    ;
  Year+1;
  Capital+5000;
  Capital+Capital*.05;
  output;
 end;
run;

data yatirim;
 do Yil=1 to 100 until(Sermaye>300000);
  do sayac=1 to 5;
  
  Sermaye+5000;
  Sermaye+Sermaye*.05;
  output;
 end;
run;

proc print data=yatirim; run; 

/* Temperature */

(F-32)*5/9 = Celcius

array Temps{24} T1-t24

/* Array Processing in SAS System */

array Katki{4} Qtr1 Qtr2 Qtr3 Qtr4 ;

array Katki2{4} Q1 Qtr2 UcuncuCeyrek Qtr4 ;

do sayac= 1 to 4 ;
 Katki2{sayac}=Katki2{sayac}*1.50;
end;

do sayac= 1 to 4 ;
 Katki2{1}=Katki2{1}*1.50;
end;

do sayac= 1 to 4 ;
 Q1=Q1*1.50;
end;

do sayac= 1 to 4 ;
 Qtr2=Qtr2*1.50;
end;

data sicaklik_donusum(drop= i);
	set botas.ski;
	array fah{24} T1-T24;
	array cel{24} F1-F24;
	do i=1 to 24;
		cel{i}=(fah{i}-32)*9/5;
	end;
run;

/*Merging DataSets */

/* 10.45 devam ediyoruz */

data hepsi  /* noactiv noacct islem */;
 merge Botas.Transact(in=Intrans) Botas.Branches(in=inBranches);
 by ActNum;
 
 if Intrans=1 or inBranches=1 then output hepsi; /* Inner Join */

run;

/* SQL : Structured Query Language  */


proc sql ;

create table BOTAS.BMW as
select Make, Model, Invoice
from SAShelp.Cars
where Make contains 'BMW'
order by Invoice;

Quit;

proc sql noexec ;
select Make, Model, Invoice
from SAShelp.Cars
where Make contains 'BMW';

Quit;

proc sql ;

create table BOTAS.BMW2 as
select *
from SAShelp.Cars
where Make contains 'BMW'
order by Invoice;

Quit;

proc sql;
 select distinct Model
 from SAShelp.Cars;
quit;

proc sql;
 select Model
 from SAShelp.Cars
 where Model like 'B%';
quit;

 
proc sql;
 select Model, Invoice*3 as NewInvoice
 from SAShelp.Cars
 where calculated NewInvoice > 100000;
quit;

/* 11.45 */

proc sql;

 title 'Mevcut Ucret Bilgisi';
 title2 'Tüm Seviyeler';
 
 select EmpID label='Employee Identifier', 'bonus is: ', Salary*0.05 format=dollar12.2
 
 from botas.payrollmaster
 where JobCode contains 'NA'
 order by Salary desc;

quit;

proc sql;
 select JoBCode, avg(Salary) as ortalamaucret
 from Botas.payrollmaster
 group by JoBCode
 having  ortalamaucret> 50000;
quit;

/* SubQueries */

proc sql;
 select EmpID, Gender, JobCode
 from Botas.payrollmaster
 where EMPID in 
  (select EMPID from BOTAS.payrollmaster where month(DateofBirth)=2);
quit;


/* Exercise 1*/

proc sql;
create table BOTAS.Exercise1 as
select t1.EmpID, t2.FirstNAme, t2.LastName, t2.JobCode, t1.FltID, t1.SchDate
from Botas.RDUSCHEDULE t1 inner join Botas.FLTSPTS t2 on t1.EmpID=t2.ID;
quit;

proc sql;
 create table Revenue as
 select t1.ProdCode, t1.Qty, t2.Price, t1.Qty*t2.Price as Revenue
 from Botas.todaysales t1 inner join BoTas.prices t2 on t1.ProdCode=t2.ProdCode;
quit;

proc sql;
 create table NotSold as
 select t1.ProdCode, t1.Price
 from BoTas.prices  t1 left join Botas.todaysales t2 on t1.ProdCode=t2.ProdCode
 where  t2.Qty is null ;
quit;

proc sql;
 create table invalidcode as
 select t2.ProdCode as prodcode2, t2.Qty
 from BoTas.prices  t1 full join Botas.todaysales t2 on t1.ProdCode=t2.ProdCode
 where t1.prodcode is null;
quit;

/* Exercise 3 */

data quarter (Keep=ID Diff1 Diff2 Diff3 Diff4) ;
 set botas.donate;
 Average=mean(of Qtr1-Qtr4);
 
 array Contrib{4} Qtr1-Qtr4;
 array Diff{4};
 
 do Qtr=1 to 4;
  Diff{Qtr}=Contrib{Qtr}-Average ;
 end;
  
run;

/* Exercise 4 */

data future;
 Wages=12874000;
 Retire=1765000;
 Medical=649000;
 Year=year(today());
 
 do until(Year=year(today()) + 10);
 Year+1;
 Wages+(Wages*0.06);
 Retire+(Retire*0.014);
 Medical+(Medical*0.095);
 output;
 end;
run;
 

data future2;
 Wages=12874000;
 Retire=1765000;
 Medical=649000;
 
 do Year= year(today())+1  to year(today())+10 ;
 Wages+(Wages*0.06);
 Retire+(Retire*0.014);
 Medical+(Medical*0.095);
 output;
 end;
run;




 
/* Exercise 5 */

data students(drop=Number DOB);
set Botas.students;

Telephone=substr(put(Number,7.),1,3) !! '-' !! substr(put(Number,7.),4,4);
Birthday=input(DOB,date9.);
format Birthday mmddyy10.;
run;


/* Call example */
/* Proc transpose */

ods noproctitle;
ods select attributes variables;

proc datasets;
	contents data=Botas.Students order=collate;
quit;

proc means data=SASHELP.CARS mean std ;
	var Invoice;
	output out=botas.sonuc;
run;

data _null_ ;
 set botas.sonuc ;
 
 if _stat_='MEAN' then do ;
  call symputx('ortalama',Invoice,G);
 end;
 
  if _stat_='STD' then do ;
  call symputx('sapma',Invoice,G);
 end;
run;
 
 
 %put &ortalama.;
 %put &sapma. ;
 
data _x_ (where=(Anomaly='YES'));
  set SASHELP.CARS ;
  Ustlimit=&ortalama + 3*&sapma;
  Altlimit=&ortalama - 3*&sapma;
  if Invoice>Ustlimit then Anomaly='YES';
run;

ods noproctitle;

proc freq data=SASHELP.CARS;
	tables  (Make) *(Origin) / chisq nopercent norow nocol nocum 
		plots(only)=(freqplot mosaicplot);
run;























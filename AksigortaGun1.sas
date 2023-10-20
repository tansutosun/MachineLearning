/* Kutuphane olusturma */

libname AKSLIB "/home/tansu.tosun0/Aksigorta" ;

/* Print procedure */

proc print data=sashelp.air;
run;

/* Data Step */

data akslib.ornek;
 x=5;
run;

/* Mevcut veriden yeni veri olusturma */

data akslib.ornek2;
 set akslib.ornek;
 y=10;
run;

/* SASHelp.Cars; */

data akslib.Cars;
 set sashelp.Cars;
run;

/* Yeni Invoice degiskeni ekleyelim */

data akslib.Cars;
 set akslib.Cars;
 New_INVOICE=Invoice*1.1;
run;

/* Naming Conventions */

/* Contents Procedure */

proc contents data=akslib.cars;
run;

/* Sıralama */

Proc sort data=akslib.Cars out=akslib.sorted_cars;
 by invoice ;
run;

/* Title / Foottnote */

proc print data=akslib.Cars label;
 where Origin="Europe" ;
 title1 "Üst Başlık" ;
 title2 "Bir alt Başlık" ;
 label Make="Arabanın Markası" ;
 var Make Origin New_Invoice; 
 format New_Invoice dollar11.2 ;
run;

/* Infile Statement */

data work.person;
   infile datalines delimiter=','; 
   input name $ dept $;
   datalines;                      
John,Sales
Mary,Acctng
Tansu, SALES
;
run;

/* Using SAS Functions */

data work.yeniveri;
 set akslib.cars;
 yenidegisken1=sum(mpg_city, mpg_highway);
 yenidegisken2=mpg_city + mpg_highway;
run;

data yeni;
 set akslib.dfwlax;
 Total1=FirstClass + Economy ;
 Total2=sum(FirstClass, Economy) ;
 tarih=today();
 format tarih date9. ;
 gun=day(date);
 ay=month(date);
 yil=year(date);
 Date2=mdy(ay,gun,yil);
 format Date2 date9. ;
 /* QTR, weekday */
run;

/* Drop Keep Functions */

data keep_data;
 set akslib.dfwlax(keep=Flight Date FirstClass Economy);
 Total1=FirstClass + Economy ;
 /* drop FirstClass Economy; */
 keep Flight Date Total1;
run;

data keep_data;
 set akslib.dfwlax(drop=FirstClass Economy);
 Total1=FirstClass + Economy ;
run;

/* IF Conditions */

/*
LAX FirstClass 2000$ Economy 1200$
DFW FC 1500$ Economy 900$
*/

data Revenue;
 set akslib.dfwlax;
  Total=FirstClass + Economy ;
  if upcase(Dest)="LAX" then REvenue=sum(FirstClass*2000,Economy*1200);
  else if upcase(Dest)="DFW" then REvenue=sum(FirstClass*1500,Economy*900);
 run;

data Revenue;
 set akslib.dfwlax;
  length City $11. ;
  Total=FirstClass + Economy ;
  
  if upcase(Dest)="LAX" then do ;
   REvenue=sum(FirstClass*2000,Economy*1200);
   City="Los Angeles";
   end;
   
  else if upcase(Dest)="DFW" then do ; 
   REvenue=sum(FirstClass*1500,Economy*900);
   City="Dallas" ;
  end;
   
 run;
 
 /* Subsetting IF */

data Revenue2;
 set REvenue;
 where Total lt 150 then delete;
 run;
 
 
data tarih;
 tarih=today();
 c=date();
 d=datetime();
 d_withformat=d;
 format d_withformat DATETIME. ;
 run;
 
data tarih;
tarih=today();
c=date();
d=datetime();
e=datepart(d);
d_withformat=d;
format d DATEAMPM.;
run;


 /* Dataları birleştirme */

data work.europe work.Asia ;
 set akslib.Cars;
 if Origin="Europe" then output work.europe;
 if Origin="Asia" then output work.Asia;
 
run;

data work.EUR_ASIA;
 set work.europe work.Asia;
run;

/* Merge Command */

data akslib.performance;
set akslib.performance;
rename Month=Ay ;
run;


data akslib.compare;
 merge akslib.performance(rename=(Ay=Month)) akslib.goals;
 by Month;
 Fark=Sales-Goal;
run;

proc sort data=akslib.goals;
 by Month;
run;

data akslib.compare;
 merge akslib.performance(rename=(Ay=Month)) akslib.goals;
 by Month;
 Fark=Sales-Goal;
run;

data akslib.performance2;
 set akslib.performance;
 if Ay in(7,8) then delete;
run;

data akslib.Goals2;
 set akslib.Goals;
 if Month in(11,12) then delete;
 rename Month=Ay;
run;

data akslib.compare2;
 merge akslib.performance2(in=indata1) akslib.goals2(in=indata2);
 by Ay;
 Fark=Sales-Goal;
 if indata2=1 and indata1=1 then output;
run;

/* Growth */

data forecast;
 set Akslib.growth;
 Forecast=Numemps*(1+Increase);
 Year=1;
 output;
 Forecast=Forecast*(1+Increase);
 Year=2;
 output;
 Forecast=Forecast*(1+Increase);
 Year=3;
 output;
run;

/* Do Loop */

data forecast;
 set Akslib.growth;
 Forecast=Numemps;
 do i=1 to 10 by 1;
 Forecast=Forecast*(1+Increase);
 output;
 end;
run;

/* Writing to Multiple Datasets */
	

data APTOPS FINACE FLTOPS HUMRES SALES;
 set Akslib.growth;
 if Division="APTOPS" then output APTOPS ;
 else if Division="FINACE" then output FINACE ;
 else if Division="FLTOPS" then output FLTOPS ;
 else if Division="HUMRES" then output HUMRES ;
 else if Division="SALES" then output SALES ;
run;

/* SAS SQL */

proc sql;
select Make, Model, Invoice, Type, Origin
from AKSLIB.CARS
where Type="Sedan" and Origin="Europe"
order by Invoice;
quit;

proc sql;
 select sum(Invoice) as toplamfatura, Origin 
 from AKSLIB.CARS
 group by Origin;
quit;

proc sql;
create table akslib.data1 as 
select Make, Model, Invoice, Type, Origin
from AKSLIB.CARS
where Type="Sedan" and Origin="Europe"
order by Invoice;
quit;

proc sql;
create table akslib.data2 as 
select Make, Model, MSRP
from AKSLIB.CARS
where Type="Sedan" and Origin="Europe"
order by Invoice;
quit;


proc sql;
 create table akslib.birlesikveri as 
 select t1.Make, t1.Model, t1.Invoice, t2.MSRP
 from akslib.data1 as t1 left join akslib.data2 as t2 on t1.Make=t2.Make and t1.Model=t2.Model;
 quit;

proc sql;
 select t1.Make, t1.Model, t1.Invoice, t2.MSRP
 from akslib.data1 as t1 left join akslib.data2 as t2 on t1.Make=t2.Make and t1.Model=t2.Model;
 quit;

proc sql;
 create view akslib.birlesikveri2 as 
 select t1.Make, t1.Model, t1.Invoice, t2.MSRP
 from akslib.data1 as t1 left join akslib.data2 as t2 on t1.Make=t2.Make and t1.Model=t2.Model;
quit;

proc contents data=akslib.birlesikveri ; run; /*256kb */

proc contents data=akslib.birlesikveri2 ; run; /* 0b */


/* Of command */

data katk;
 set akslib.donate;
 toplam=sum(of Qtr1-Qtr4);
 if toplam ge 150 ;
run;
















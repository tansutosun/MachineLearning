

/* Assign a Library */

libname AKSKTP "/home/tansu.tosun0/AKSIGORTA2" ;

/* Bir kutuphane ismi max 8 uzunlukta olabilir. */

/* Data Step */

data aksktp.veri; 
/* Veri ismi max 32 uzunlukta olabilir */
 degisken=5;
 /* Degisken ismi max 32 uzunlukta olabilir */
 /* Büyük küçük harf duy. yk. */
 /* Sayı ile baslayamazlar */
 /* noktalama isaretleri olamaz */
run;


proc print data=aksktp.veri;
run;

proc print data=sashelp.cars;
run;

data aksktp.veri2;
 isim="Ali";
run;

/* transfer from a library */

Data aksktp.Carsv2;
 set sashelp.cars;
run;


/* Metadata Information */

proc contents data=aksktp.carsv2 out=work.verihkbilgi;
run;


proc print data=sashelp.cars noobs;
 var Make Model Invoice Origin; 
 where Origin="Europe";
run;

proc print data=sashelp.cars noobs;
 var Make Model Invoice Origin; 
 where Invoice >25000 ;
run;

proc print data=sashelp.cars noobs;
 var Make Model Invoice Origin; 
 where Origin eq "Europe";
run;

proc print data=sashelp.cars noobs;
 var Make Model Invoice Origin; 
 where Invoice gt 25000 ;
run;

/* Cars Verisetinden Asia olan araçları yeni bir veri ile kutuphanenize yazınız */

proc print data=sashelp.cars;
var Make Model Origin;
where Origin eq "asia";
run;


proc print data=sashelp.cars;
var Make Model Invoice Origin;
where Origin="Asia";
run;

/* Data , View , Report */

Data aksktp.AsianCars;
 set sashelp.cars;
 where Origin="Asia" ;
run;


Data aksktp.carasian;
 set sashelp.cars; 
 where Origin="Asia" and Invoice gt 50000;
run;

Data aksktp.carasian;
 set sashelp.cars; 
 where Origin="Asia" or Invoice gt 50000;
run;

data aksktp.eurasiacars;
 set sashelp.cars;
 where Origin in('Asia','Europe');
 run;

data work.veri;
 set aksktp.carsv2;
 where Invoice between 30000 and 40000;
run;

/* Contains */

data work.veri;
 set aksktp.carsv2;
 where Model ? 'Quest' ; 
run;

data work.degerlimüsteri;
vergi= (PromSpend*10)/100;
set aksktp.organics;
run;

data work.degerlimüsteri;
retain vergi PromSpend;
set aksktp.organics;
vergi= PromSpend*0.1;
run;

/* Sıralamak */

proc sort data=aksktp.organics;
 by descending PromSpend ;
run;

/* Dışarıdan Veri seti almak */

FILENAME REFFILE '/home/tansu.tosun0/AKSIGORTA2/dfwlax.csv';
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=AKSKTP.DFWLAX;
	GETNAMES=YES;
RUN;

/* Her ucus için cir hesaplayalım */

/* FirstClass 2000$  Economy 750$ Ciro HEsaplayalım  : LAX */
/* FirstClass 1500$  Economy 500$ Ciro HEsaplayalım  : DFW */

data aksktp.dfwlax2;
 set aksktp.dfwlax;
 totalincome=FirstClass*2000 + Economy*750 ;
 ciro=sum(FirstClass*2000,Economy*750);
 
 /* Date Functions */
 bugun=today();
 format bugun date9. ;
 
 yil=Year(Date);
 ay=month(Date);
 Ceyrek=QTR(Date);
 gun=day(Date);
 hafgun=weekday(Date);
 
 Keep date bugun yil ay Ceyrek gun hafgun; 
 
run;

data aksktp.dfwlax4;
 set aksktp.dfwlax (drop=Flight);
run;

data aksktp.dfwlax4;
 set aksktp.dfwlax (keep=FirstClass Date Economy Dest);
run;

data aksktp.dfwlax4;
 set aksktp.dfwlax ;
 drop Flight;
run;

/* 


/* Her ucus için ciro hesaplayalım */

/* FirstClass 2000$  Economy 750$ Ciro HEsaplayalım  : LAX */
/* FirstClass 1500$  Economy 500$ Ciro HEsaplayalım  : DFW */

data yeniveri;
 set aksktp.dfwlax;
 length City $ 11 ;
 
 if upcase(Dest)="DFW" then do ;
  Ciro=sum(FirstClass*1500,Economy*500) ;
  City="Dallas";
 end;
 
 else if upcase(Dest)="LAX" then do;
  Ciro=sum(FirstClass*2000,Economy*750);
  City="Los Angeles";
 end;
 
 TotalPass=sum(FirstClass,Economy);
 
run;


/* Subsetting IF Conditions */

data yeniveri;
 set yeniveri;
 if TotalPass > 175;
run;

/* > 13DEC2000 */


data aksktp.dfwlax5;
 set aksktp.dfwlax;
 if Date > '13DEC2000'd ;
run;
 
 

data work.raises;

set aksktp.fltattnd;

If JobCode="FLTAT1" then Increase=Salary*0.1;

else If JobCode="FLTAT2" then Increase=Salary*0.08;

else If JobCode="FLTAT3" then Increase=Salary*0.06;

NewSal=sum(Salary,Increase);

Keep EmpID Salary Increase NewSal;

run;


/* Origin 3 tane Asia Europe USA */

data europe asia usa;
 set aksktp.carsv2;
 if origin="Europe" then output europe;
 else if origin="Asia" then output asia;
 else output usa;
run;


/* MErge X Append */

data fulldata;
 set europe asia usa;
run;

/* MErge */

data work.data1;
 set sashelp.cars;
 keep Model Origin;
run;




data work.data2;
 set sashelp.cars;
 keep Model Invoice;
run;


proc sort data=data1; by Model; run;
proc sort data=data2; by Model; run;

/* Left Join */
data birlesikveri;
 merge data1(in=indata1) data2(in=indata2);
 by Model;
 if indata1=1 then output;
run;

/* Right Join */
data birlesikveri;
 merge data1(in=indata1) data2(in=indata2);
 by Model;
 if indata2=1 then output;
run;
/* Inner Join */
data birlesikveri;
 merge data1(in=indata1) data2(in=indata2);
 by Model;
 if indata1=1 and indata2=1 then output;
run;















/* Library >> Data silos >> Dataset (GBDQ) >> Mİcrosoft/oracle : Schema >>>> Data Basket */ 

/* Explore Data */

proc sql ;
select FirstName, LastName, City, State
from sasuser.customer (obs=100);
quit;

proc sql number;
select FirstName, LastName, City, State
from sasuser.customer (obs=100);
quit;

/* 17.20 GT+2 */

/* Create a simple Report */

/* 10 customers, CreditScore > 700, highest 10 customers */

Proc sql;
 select CustomerID, CreditScore, FirstName, LastName
 from sasuser.customer (obs=10)
 where CreditScore > 700 
 order by CreditScore desc;
quit;

/* Create a new data */

proc sql;
 create table work.tiny_customer as 
 select FirstName, LastName, CreditScore
 from sasuser.customer 
 order by CreditScore desc;
quit;

Proc sql;
select FirstName, LastName, CreditScore
from work.tiny_customer (obs=10);
quit;

/* Ex: Extract the highest 10 customers based on CreditScore */

/* Ex: Generate a table from NC Customers Source: Customers table */

proc sql;
create table Work.NCCustomers as
select CustomerID, FirstName, LastName, State
from sasuser.customer
where State='NC';
quit;

/* GEnerate a new data set (work.NCSegment1) from customers table
NC customers
Credi Score > 700
Income variable between 0 and 30000 
*/

proc sql;
create table work.ncsegment1 as
select FirstName, LastName, State, CreditScore, Income
from sasuser.customer
where State ="NC" and CreditScore>700 and Income> 0 AND Income< 30000;
quit;

/* And / Or >> Logical Operators */

/* In Operator */
/* NC, NY, CA */

proc sql;
create table work.NC_NY_CA as 
select * from sasuser.customer
where State="NC" or State="NY" or State="CA" ;
quit;

proc sql;
create table work.NC_NY_CA as 
select * from sasuser.customer
where State in ("NC","NY","CA") ;
quit;

/* NA / null */

proc sql;
 create table work.Incomenull as
 select FirstName, LastName, Income
 from sasuser.customer
 where Income is null;
quit;

proc sql;
 create table work.Incomenotnull as
 select FirstName, LastName, Income
 from sasuser.customer
 where Income is not null;
quit;

proc sql;
 create table work.Incomenotnull as
 select FirstName, LastName, Income
 from sasuser.customer
 where Income=. ;
quit;

proc sql;
 create table work.Incomenotnull as
 select FirstName, LastName, Income, Married
 from sasuser.customer
 where Married=' ' ;
quit;

/* Between */

proc sql;
 create table work.CSbetween700_800 as
 select FirstName, LastName, Income, Married, CreditScore
 from sasuser.customer
 where CreditScore between 700 and 800 ;
quit;

/* Pattern Matching */

proc sql;
 create table work.Name_with_Z as
 select FirstName, LastName, Income, Married, CreditScore
 from sasuser.customer
 where FirstName like "A%" ;
quit;

proc sql;
 create table work.Name_with_Z as
 select FirstName, LastName, Income, Married, CreditScore
 from sasuser.customer
 where FirstName like "Z_l%" ;
quit;

proc sql;
 create table work.Name_with_Z as
 select FirstName, LastName, Income, Married, CreditScore
 from sasuser.customer
 where FirstName like "%har%" ;
quit;

/* WarnUp Exercise */

/* Top 10 customers by Income without a BANKID and CreditScore Over 700 */

proc sql outobs=10;
 select FirstName, LastName, CustomerID, State, Income, BankID, CreditScore
 from sasuser.customer
 where BankID is null and CreditScore>700 
 order by Income desc;
quit;

/* List customers with DOB  < '31DEC1949'd and Employed='Y'  

34: Numeric 
'Ali34' : String  = AlphaNum

'31DEC1949'd : String */

proc sql (inobs=10) ;
 select FirstName, LastName, DOB format=Date9. as Date_of_birth /* Which  variables will be extracted? */
 from sasuser.customer /*What is the Source data */ 
 where DOB < '31DEC1949'd and Employed='Y'  /*Filters wanted to be applied to query */
 order by DOB desc/* Sort the output */ ;
quit;

/* SAS SQL reference : 01JAN1960 */

/* 17.40 */

/* Find Customers whose age > 70 */

proc sql;
 create table work.agegt70 as
 select FirstName, LastName, DOB format=Date9. as Date_of_birth, yrdif(DOB,'13JUN2022'd) as Age
 from sasuser.customer
 where yrdif(DOB,'13JUN2022'd)>70 ;
quit;

proc sql;
 create table work.agegt70 as
 select FirstName, LastName, DOB format=Date9. as Date_of_birth, yrdif(DOB,'13JUN2022'd) as Age
 from sasuser.customer
 where calculated Age>70 ;
quit;

/* Assign Values to a New Column Conditionally */

proc sql;
select distinct Married 
from sasuser.customer ;
quit;

proc sql outobs=100;
 select FirstName, LAstName, Married,
  case when Married='M' then "Married"
       when Married='S' then "Single"
       when Married='D' then "Divorced"
       when Married='W' then "Widowed"
       else "Unknown"
  end as Category
  from sasuser.customer;
quit;

/* CS >750 : Excellent, 700-750 : Good,  650-699 : Fair, 550-549 : Poor, 0-549 : Bad  >> CreditCategory */ 

proc sql ;
create table work.sonuc as
 Select FirstName, LastName, CreditScore, 
 case when CreditScore>750 then "Excellent"
      when CreditScore>700 then "Good"
      when CreditScore>650 then "Fair"
      when CreditScore>550 then "Poor"
     else "Bad"
 end as Category
from sasuser.customer;
quit;

proc sql outobs=100;
select firstname, lastname, creditscore,
case when creditscore > 750 then "excellent"
 when creditscore between 700 and 750 then "good"
 when creditscore between 650 and 699 then "fair"
 when creditscore between 550 and 649 then "poor"
 when creditscore between 0 and 549 then "bad"
else "byz"	
end as creditcategory
from sasuser.customer;
quit;

/* 17.00 */ 

Proc sql;
Select CustomerName label='Customer Name',
       MerchantName label='Merchant Name', 
       Type, Service, 
       Amount format=dollar10.2 label='Transaction Amount'
from sasuser.transactionfull
where Amount>1000 and Service <> "University"
order by Amount desc;
quit;


/* Exercise: Input : customer , FirstName, LN, DOB
Filter: NC, whose month(DOB) is MAY
*/

proc sql;
 select FirstName, LastName, DOB format=Date9. , month(DOB) as Birth_month
 from sasuser.customer
 where State='NC' and month(DOB)=5 ;
quit;

/* break : 17:50 */




proc sql;
select FirstName label='Initial', LastName label='Last Name', CreditScore label='Credit Score', DOB format=Date9. as Date_Of_Birth,
case when DOB between '01JAN1928'D AND '31DEC1945'D then 'Silent'
     when DOB between '01JAN1946'D AND '31DEC1964'D then 'Boomer'
     when DOB between '01JAN1965'D AND '31DEC1979'D then 'Genx'
     when DOB between '01JAN1980'D AND '31DEC1996'D then 'Geny'
     when DOB > '01JAN1997'D then 'Post-Milennial'
else "Unknown"
end as Generation
from sasuser.customer
Where CreditScore is not null and State='VT'
Order by Generation, CreditScore desc;
quit;

/* Extract Transactions which  executed on November / Dec */

/* JUNE 19 */

/* Eliminating Duplicate Records */

proc sql;
 select distinct State
 from cci_sql.customer;
quit;

/* Summarizing Data : Down A Column */

proc sql;
 select max(PopEstimate1) as MaxEst, min(PopEstimate1) as MinESt, avg(PopEstimate1) as average
 from cci_sql.statepopulation;
quit;

/* Summarizing Data : Across A Row */

proc sql;
 select max(PopEstimate1, PopEstimate2, PopEstimate3) as MaxEst, 
        min(PopEstimate1, PopEstimate2, PopEstimate3) as MinESt
 from cci_sql.statepopulation;
quit;

/* Count() Function */

proc sql;
 select count(CustomerID) as totalnum 
 from cci_sql.customer;
quit;

/* How many customers are in my data ? */

proc sql;
 select count(distinct CustomerID) as totalnum 
 from cci_sql.customer;
quit;

/* How many customers are in each state */

proc sql;
 select State, count(distinct CustomerID) as totalnum 
 from cci_sql.customer
 group by State
 order by State;
quit;


/* Date & Datetime */

Proc sql;
 select transactionid, 
        datepart(datetime) as Date format=date9.,
        timepart(datetime) as time format=time.
 from cci_sql.transactionfull;
quit;

/* Exract year info */

Proc sql;
 select transactionid, datetime,
        year(datepart(datetime)) as year ,  month(datepart(datetime)) as month, 
        timepart(datetime) as time format=time.
 from cci_sql.transactionfull;
quit;

/* Boolean Expressions */

Proc sql;
 create table cci_sql.customer2 as
 select FirstName, Lastname, State, DOB as Date_of_birth format=Date9., Income, CreditScore
 from cci_sql.customer;
quit;

/* Calculate Age Variable */

proc sql;
 create table cci_sql.customerage as 
 select *, round(yrdif(Date_of_birth, today())) as age
 from cci_sql.customer2 ;
quit;

/* Lets generate a new boolean variable */

proc sql outobs=100;
 select * , age <40 as Ageindicator
 from cci_sql.customerage;
quit;

/* What are the Unique country codes ? */

/*GlobalFull table */

PROC SQL;
SELECT DISTINCT COUNTRYCODE
FROM CCI_SQL.GLOBALFULL;
QUIT ;

/* Upperclass table : Customers whose Income is more than Avg(Income)+2*Stdev(Income) */

proc sql;
select Avg(Income) as AverageIncome, std(Income) as deviationIncome,  Avg(Income)+2*std(Income) as Upperlimit
from cci_sql.customer;
quit;

/* 93332.71 */

proc sql;
select Avg(Income)+2*std(Income) as Upperlimit
from cci_sql.customer;
quit;

/* SUBQUERY Example */

proc sql;
create table cci_sql.uppercrust as 
select * 
from cci_sql.customer
where Income> (select Avg(Income)+2*std(Income) as Upperlimit from cci_sql.customer);
quit;

/* Alternative Query */

proc sql;
create table cci_sql.uppercrust as 
select * 
from cci_sql.customer
having Income> (Avg(Income)+2*std(Income)) ;
quit;


 proc sql;
select avg(Income)
from cci_sql.customer;
quit;

/* Where Clause 0 HAVING */


/* SQL Procedures */

Proc sql;
select 
from 
where 
group by
order by
having
; 
quit;
 
/* 12.20 */

/* SQL JONS */


proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID
 from cci_sql.smallcustomer t1;
quit;

proc sql;
 select t2.AccountID, t2.Amount
 from cci_sql.smalltransaction t2;
quiT;

/* Join 2 Tables */

proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID as AccountD1, t2.AccountID as AccountD2, t2.Amount
 from cci_sql.smallcustomer t1 inner join cci_sql.smalltransaction t2 on t1.AccountID=t2.AccountID;
quit;

proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID as AccountD1, t2.AccountID as AccountD2, t2.Amount
 from cci_sql.smallcustomer t1 left join cci_sql.smalltransaction t2 on t1.AccountID=t2.AccountID;
quit;


proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID as AccountD1, t2.AccountID as AccountD2, t2.Amount
 from cci_sql.smallcustomer t1 right join cci_sql.smalltransaction t2 on t1.AccountID=t2.AccountID;
quit;


proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID as AccountD1, t2.AccountID as AccountD2, t2.Amount, t2.Services
 from cci_sql.smallcustomer t1 inner join cci_sql.smalltransaction t2 on t1.AccountID=t2.AccountID;
quit;

proc sql;
 select t1.FirstName, t1.LastName, t1.AccountID as AccountD1, t2.AccountID as AccountD2, t2.Amount, t2.Services
 from cci_sql.smallcustomer t1 full join cci_sql.smalltransaction t2 on t1.AccountID=t2.AccountID;
quit;

/* 13.15 */

data cci_sql.data;
 Name="Sharif";  Age=49;output;
 Name="John";  Age=30;output;
 run;

data cci_sql.data2;
 Name="Michael";  Salary=4000;output;
 Name="John";  Salary=10000;output;
run;

proc sql;
 select t1.Name, t1.Age 
 from cci_sql.data t1;
quit;




proc sql;
 select t1.Name as Name_table1, t1.Age, t2.Name as Name_table2, t2.Salary
 from cci_sql.data t1 left join cci_sql.data2 t2 on t1.Name;
quit;

proc sql;
 select t1.Name as Name_table1, t1.Age, t2.Name as Name_table2, t2.Salary
 from cci_sql.data t1 inner join cci_sql.data2 t2 on t1.Name=t2.Name;
quit;

proc sql;
 select t1.Name as Name_table1, t1.Age, t2.Name as Name_table2, t2.Salary
 from cci_sql.data t1 right join cci_sql.data2 t2 on t1.Name=t2.Name;
quit;

proc sql;
 select t1.Name as Name_table1, t1.Age, t2.Name as Name_table2, t2.Salary
 from cci_sql.data t1 full join cci_sql.data2 t2 on t1.Name=t2.Name;
quit;


























/* ----------------------------------------
   Generate SAS data tables for:
   EGBS -  SAS Enterprise Guide: ANOVA, Regression
           and Logistic Regression 
   ---------------------------------------- */

options fmtsearch=(sasuser);

data sasuser.Advertise
           (keep=ad sales);
  length ad $8;
  input ad area sales;
  datalines;
paper        1       75
radio        1       69
people       1       63
display      1       52
paper        2       57
radio        2       51
people       2       67
display      2       61
paper        3       76
radio        3      100
people       3       85
display      3       61
paper        4       77
radio        4       90
people       4       80
display      4       76
paper        5       75
radio        5       77
people       5       87
display      5       57
paper        6       72
radio        6       60
people       6       62
display      6       52
paper        7       76
radio        7       33
people       7       70
display      7       33
paper        8       81
radio        8       79
people       8       75
display      8       69
paper        9       63
radio        9       73
people       9       40
display      9       60
paper       10       94
radio       10      100
people      10       64
display     10       61
paper       11       54
radio       11       61
people      11       40
paper       12       70
radio       12       68
people      12       67
display     12       66
paper       13       87
radio       13       68
people      13       51
display     11       41
display     13       65
paper       14       65
radio       14       63
people      14       61
display     14       58
paper       15       65
radio       15       83
people      15       75
display     15       50
paper       16       79
radio       16       76
people      16       64
display     16       44
paper       17       62
radio       17       73
people      17       50
display     17       45
paper       18       75
radio       18       74
people      18       62
display     18       58
paper        1       68
radio        1       54
people       1       58
display      1       41
paper        2       75
radio        2       78
people       2       82
display      2       44
paper        3       83
radio        3       79
people       3       78
display      3       86
paper        4       66
radio        4       83
people       4       87
display      4       75
paper        5       66
radio        5       74
people       5       70
display      5       75
paper        6       76
radio        6       69
people       6       77
display      6       63
paper        7       70
radio        7       68
people       7       68
display      7       52
paper        8       86
radio        8       75
people       8       61
display      8       61
paper        9       62
radio        9       65
people       9       55
display      9       43
paper       10       88
radio       10       70
people      10       76
display     10       69
paper       11       56
radio       11       53
people      11       70
display     11       43
paper       12       86
radio       12       73
people      12       77
display     12       51
paper       13       84
radio       13       79
people      13       42
display     13       60
paper       14       77
radio       14       66
people      14       71
display     14       52
paper       15       78
radio       15       65
people      15       65
display     15       55
paper       16       80
radio       16       81
people      16       78
display     16       52
paper       17       62
radio       17       57
people      17       37
display     17       45
paper       18       70
radio       18       65
people      18       83
display     18       60
run;

data sasuser.AdvertiseBlocked;
  length ad $8;
  input ad area sales;
  datalines;
paper        1       75
radio        1       69
people       1       63
display      1       52
paper        2       57
radio        2       51
people       2       67
display      2       61
paper        3       76
radio        3      100
people       3       85
display      3       61
paper        4       77
radio        4       90
people       4       80
display      4       76
paper        5       75
radio        5       77
people       5       87
display      5       57
paper        6       72
radio        6       60
people       6       62
display      6       52
paper        7       76
radio        7       33
people       7       70
display      7       33
paper        8       81
radio        8       79
people       8       75
display      8       69
paper        9       63
radio        9       73
people       9       40
display      9       60
paper       10       94
radio       10      100
people      10       64
display     10       61
paper       11       54
radio       11       61
people      11       40
paper       12       70
radio       12       68
people      12       67
display     12       66
paper       13       87
radio       13       68
people      13       51
display     11       41
display     13       65
paper       14       65
radio       14       63
people      14       61
display     14       58
paper       15       65
radio       15       83
people      15       75
display     15       50
paper       16       79
radio       16       76
people      16       64
display     16       44
paper       17       62
radio       17       73
people      17       50
display     17       45
paper       18       75
radio       18       74
people      18       62
display     18       58
paper        1       68
radio        1       54
people       1       58
display      1       41
paper        2       75
radio        2       78
people       2       82
display      2       44
paper        3       83
radio        3       79
people       3       78
display      3       86
paper        4       66
radio        4       83
people       4       87
display      4       75
paper        5       66
radio        5       74
people       5       70
display      5       75
paper        6       76
radio        6       69
people       6       77
display      6       63
paper        7       70
radio        7       68
people       7       68
display      7       52
paper        8       86
radio        8       75
people       8       61
display      8       61
paper        9       62
radio        9       65
people       9       55
display      9       43
paper       10       88
radio       10       70
people      10       76
display     10       69
paper       11       56
radio       11       53
people      11       70
display     11       43
paper       12       86
radio       12       73
people      12       77
display     12       51
paper       13       84
radio       13       79
people      13       42
display     13       60
paper       14       77
radio       14       66
people      14       71
display     14       52
paper       15       78
radio       15       65
people      15       65
display     15       55
paper       16       80
radio       16       81
people      16       78
display     16       52
paper       17       62
radio       17       57
people      17       37
display     17       45
paper       18       70
radio       18       65
people      18       83
display     18       60
run;

data sasuser.BostonMarathon;
  input age tottime halftime;
  datalines;
36 9604 4593
45 11121 4822
41 14754 7183
55 15492 7181
46 12341 6034
26 15834 7639
53 14864 7216
48 13283 6631
42 13304 6230
36 11784 5469
36 12205 5977
35 16864 7682
34 15213 7593
40 11636 5526
40 16872 7481
39 10464 5086
46 12135 5983
28 15294 6978
37 10479 5000
39 13540 5728
34 12242 5505
27 14906 7011
50 12321 6119
36 17121 7962
39 10353 4868
38 12267 5754
47 12953 6158
28 15196 7816
38 10645 5088
27 13768 7028
40 11354 5400
32 13759 6770
25 7834 3976
33 15517 7445
25 11496 5495
47 12671 6368
55 13373 5877
40 12174 5715
44 11513 5425
44 11824 5910
32 10815 5441
54 16803 7996
40 13294 5624
44 13545 6156
43 12696 6037
38 17340 8146
42 11140 5545
30 11355 5368
27 11914 5852
45 11677 5463
;
run;

data sasuser.BostonNewYork;
  input marathon $ tottime;
  datalines;
BOSTON 9604
BOSTON 11121
BOSTON 14754
BOSTON 15492
BOSTON 12341
BOSTON 15834
BOSTON 14864
BOSTON 13283
BOSTON 13304
BOSTON 11784
BOSTON 12205
BOSTON 16864
BOSTON 15213
BOSTON 11636
BOSTON 16872
BOSTON 10464
BOSTON 12135
BOSTON 15294
BOSTON 10479
BOSTON 13540
BOSTON 12242
BOSTON 14906
BOSTON 12321
BOSTON 17121
BOSTON 10353
BOSTON 12267
BOSTON 12953
BOSTON 15196
BOSTON 10645
BOSTON 13768
BOSTON 11354
BOSTON 13759
BOSTON 7834
BOSTON 15517
BOSTON 11496
BOSTON 12671
BOSTON 13373
BOSTON 12174
BOSTON 11513
BOSTON 11824
BOSTON 10815
BOSTON 16803
BOSTON 13294
BOSTON 13545
BOSTON 12696
BOSTON 17340
BOSTON 11140
BOSTON 11355
BOSTON 11914
BOSTON 11677
NYC 21043
NYC 12381
NYC 16461
NYC 14786
NYC 11356
NYC 15544
NYC 19134
NYC 14407
NYC 18603
NYC 15928
NYC 14004
NYC 15711
NYC 10928
NYC 12974
NYC 14563
NYC 16278
NYC 12115
NYC 18504
NYC 19422
NYC 14133
NYC 14726
NYC 13195
NYC 25628
NYC 10015
NYC 15594
NYC 16624
NYC 16237
NYC 18714
NYC 15377
NYC 15196
NYC 14269
NYC 12334
NYC 14066
NYC 16037
NYC 15275
NYC 17908
NYC 12507
NYC 13561
NYC 18076
NYC 20611
NYC 17563
NYC 17894
NYC 17173
NYC 16225
NYC 16411
NYC 15884
NYC 14720
NYC 12104
NYC 14049
NYC 13395
NYC 12463
NYC 13944
NYC 10609
NYC 14316
NYC 14058
NYC 14222
NYC 16815
NYC 17940
NYC 13300
NYC 16176
NYC 16574
NYC 16562
NYC 19996
NYC 15794
NYC 19288
NYC 17630
NYC 17631
NYC 17508
NYC 14260
NYC 15364
NYC 18801
NYC 16769
NYC 13633
NYC 11802
NYC 14192
NYC 15139
NYC 18990
NYC 16991
NYC 18359
NYC 13766
NYC 14964
NYC 16772
NYC 15008
NYC 17589
NYC 13471
NYC 21199
NYC 20038
NYC 18305
NYC 17786
NYC 18298
NYC 17074
NYC 13535
NYC 13659
NYC 14993
NYC 18326
NYC 22662
NYC 13990
NYC 15242
NYC 20145
NYC 14080
;
run;

data sasuser.BostonTop100;
  input age tottime halftime;
  datalines;
25 7834 3976
24 7846 3971
31 7859 3971
28 7881 3976
31 7898 3974
32 7950 3973
23 7969 3973
27 7990 3973
32 8014 3974
26 8042 3975
29 8052 3973
22 8074 3971
31 8097 3974
23 8129 3974
34 8179 3995
27 8192 3974
32 8240 3974
28 8293 3974
31 8310 4050
40 8350 3974
29 8356 3976
41 8503 4187
40 8508 4050
33 8521 4134
31 8536 4187
43 8539 3974
25 8576 3974
45 8590 4187
30 8625 3973
28 8644 3974
41 8696 4144
40 8703 4189
30 8724 3975
37 8766 4370
42 8883 4192
43 8923 4350
32 8949 4390
31 8956 4169
30 8967 4378
29 8970 4370
40 8984 4350
36 8994 4190
40 9003 4187
24 9027 3975
31 9051 4390
30 9058 4050
47 9063 4169
40 9132 4382
27 9135 4400
38 9167 4489
29 9179 4398
32 9209 4396
30 9215 4390
35 9215 4584
34 9233 4476
34 9271 4577
27 9301 4464
34 9305 4506
30 9316 4188
22 9355 4279
36 9356 4477
42 9359 4540
34 9373 4498
35 9382 4386
30 9390 4478
28 9400 4653
44 9428 4554
40 9432 4653
28 9433 4629
32 9434 4585
33 9439 4508
31 9442 4631
34 9443 4557
32 9450 4472
28 9450 4585
34 9452 4187
32 9455 4609
37 9457 4662
46 9459 4515
38 9497 4514
29 9507 4192
39 9515 4704
35 9518 4584
34 9526 4638
26 9531 4723
47 9536 4720
32 9539 4289
;
run;

data sasuser.Cars1993;
  input MANUFAC $ 1-14 MODEL $ 15-30 MIDPRICE CITYMPG HWYMPG
                EGNSIZE HRSPOWER RPM REVLTNS FUELTNK WEIGHT;
  datalines;
Acura         Integra         15.9 25 31 1.8 140 6300 2890 13.2 2705
Acura         Legend          33.9 18 25 3.2 200 5500 2335 18 3560
Audi          90              29.1 20 26 2.8 172 5500 2280 16.9 3375
Audi          100             37.7 19 26 2.8 172 5500 2535 21.1 3405
BMW           535i            30 22 30 3.5 208 5700 2545 21.1 3640
Buick         Century         15.7 22 31 2.2 110 5200 2565 16.4 2880
Buick         LeSabre         20.8 19 28 3.8 170 4800 1570 18 3470
Buick         Roadmaster      23.7 16 25 5.7 180 4000 1320 23 4105
Buick         Riviera         26.3 19 27 3.8 170 4800 1690 18.8 3495
Cadillac      DeVille         34.7 16 25 4.9 200 4100 1510 18 3620
Cadillac      Seville         40.1 16 25 4.6 295 6000 1985 20 3935
Chevrolet     Cavalier        13.4 25 36 2.2 110 5200 2380 15.2 2490
Chevrolet     Corsica         11.4 25 34 2.2 110 5200 2665 15.6 2785
Chevrolet     Camaro          15.1 19 28 3.4 160 4600 1805 15.5 3240
Chevrolet     Lumina          15.9 21 29 2.2 110 5200 2595 16.5 3195
Chevrolet     Lumina_APV      16.3 18 23 3.8 170 4800 1690 20 3715
Chevrolet     Astro           16.6 15 20 4.3 165 4000 1790 27 4025
Chevrolet     Caprice         18.8 17 26 5 170 4200 1350 23 3910
Chevrolet     Corvette        38 17 25 5.7 300 5000 1450 20 3380
Chrylser      Concorde        18.4 20 28 3.3 153 5300 1990 18 3515
Chrysler      LeBaron         15.8 23 28 3 141 5000 2090 16 3085
Chrysler      Imperial        29.5 20 26 3.3 147 4800 1785 16 3570
Dodge         Colt            9.2 29 33 1.5 92 6000 3285 13.2 2270
Dodge         Shadow          11.3 23 29 2.2 93 4800 2595 14 2670
Dodge         Spirit          13.3 22 27 2.5 100 4800 2535 16 2970
Dodge         Caravan         19 17 21 3 142 5000 1970 20 3705
Dodge         Dynasty         15.6 21 27 2.5 100 4800 2465 16 3080
Dodge         Stealth         25.8 18 24 3 300 6000 2120 19.8 3805
Eagle         Summit          12.2 29 33 1.5 92 6000 2505 13.2 2295
Eagle         Vision          19.3 20 28 3.5 214 5800 1980 18 3490
Ford          Festiva         7.4 31 33 1.3 63 5000 3150 10 1845
Ford          Escort          10.1 23 30 1.8 127 6500 2410 13.2 2530
Ford          Tempo           11.3 22 27 2.3 96 4200 2805 15.9 2690
Ford          Mustang         15.9 22 29 2.3 105 4600 2285 15.4 2850
Ford          Probe           14 24 30 2 115 5500 2340 15.5 2710
Ford          Aerostar        19.9 15 20 3 145 4800 2080 21 3735
Ford          Taurus          20.2 21 30 3 140 4800 1885 16 3325
Ford          Crown_Victor    20.9 18 26 4.6 190 4200 1415 20 3950
Geo           Metro           8.4 46 50 1 55 5700 3755 10.6 1695
Geo           Storm           12.5 30 36 1.6 90 5400 3250 12.4 2475
Honda         Prelude         19.8 24 31 2.3 160 5800 2855 15.9 2865
Honda         Civic           12.1 42 46 1.5 102 5900 2650 11.9 2350
Honda         Accord          17.5 24 31 2.2 140 5600 2610 17 3040
Hyundai       Excel           8 29 33 1.5 81 5500 2710 11.9 2345
Hyundai       Elantra         10 22 29 1.8 124 6000 2745 13.7 2620
Hyundai       Scoupe          10 26 34 1.5 92 5550 2540 11.9 2285
Hyundai       Sonata          13.9 20 27 2 128 6000 2335 17.2 2885
Infiniti      Q45             47.9 17 22 4.5 278 6000 1955 22.5 4000
Lexus         ES300           28 18 24 3 185 5200 2325 18.5 3510
Lexus         SC300           35.2 18 23 3 225 6000 2510 20.6 3515
Lincoln       Continental     34.3 17 26 3.8 160 4400 1835 18.4 3695
Lincoln       Town_Car        36.1 18 26 4.6 210 4600 1840 20 4055
Mazda         323             8.3 29 37 1.6 82 5000 2370 13.2 2325
Mazda         Protege         11.6 28 36 1.8 103 5500 2220 14.5 2440
Mazda         626             16.5 26 34 2.5 164 5600 2505 15.5 2970
Mazda         MPV             19.1 18 24 3 155 5000 2240 19.6 3735
Mazda         RX-7            32.5 17 25 1.3 255 6500 2325 20 2895
Mercedes-Benz 190E            31.9 20 29 2.3 130 5100 2425 14.5 2920
Mercury       Capri           14.1 23 26 1.6 100 5750 2475 11.1 2450
Mercury       Cougar          14.9 19 26 3.8 140 3800 1730 18 3610
Mitsubishi    Mirage          10.3 29 33 1.5 92 6000 2505 13.2 2295
Mitsubishi    Diamante        26.1 18 24 3 202 6000 2210 19 3730
Nissan        Sentra          11.8 29 33 1.6 110 6000 2435 13.2 2545
Nissan        Altima          15.7 24 30 2.4 150 5600 2130 15.9 3050
Nissan        Quest           19.1 17 23 3 151 4800 2065 20 4100
Nissan        Maxima          21.5 21 26 3 160 5200 2045 18.5 3200
Oldsmobile    Achieva         13.5 24 31 2.3 155 6000 2380 15.2 2910
Oldsmobile    Cutlass_Cier    16.3 23 31 2.2 110 5200 2565 16.5 2890
Oldsmobile    Silhouette      19.5 18 23 3.8 170 4800 1690 20 3715
Oldsmobile    Eighty-Eight    20.7 19 28 3.8 170 4800 1570 18 3470
Plymouth      Laser           14.4 23 30 1.8 92 5000 2360 15.9 2640
Pontiac       LeMans          9 31 41 1.6 74 5600 3130 13.2 2350
Pontiac       Sunbird         11.1 23 31 2 110 5200 2665 15.2 2575
Pontiac       Firebird        17.7 19 28 3.4 160 4600 1805 15.5 3240
Pontiac       Grand_Prix      18.5 19 27 3.4 200 5000 1890 16.5 3450
Pontiac       Bonneville      24.4 19 28 3.8 170 4800 1565 18 3495
Saab          900             28.7 20 26 2.1 140 6000 2910 18 2775
Saturn        SL              11.1 28 38 1.9 85 5000 2145 12.8 2495
Subaru        Justy           8.4 33 37 1.2 73 5600 2875 9.2 2045
Subaru        Loyale          10.9 25 30 1.8 90 5200 3375 15.9 2490
Subaru        Legacy          19.5 23 30 2.2 130 5600 2330 15.9 3085
Suzuki        Swift           8.6 39 43 1.3 70 6000 3360 10.6 1965
Toyota        Tercel          9.8 32 37 1.5 82 5200 3505 11.9 2055
Toyota        Celica          18.4 25 32 2.2 135 5400 2405 15.9 2950
Toyota        Camry           18.2 22 29 2.2 130 5400 2340 18.5 3030
Toyota        Previa          22.7 18 22 2.4 138 5000 2515 19.8 3785
Volkswagen    Fox             9.1 25 33 1.8 81 5500 2550 12.4 2240
Volkswagen    Eurovan         19.7 17 21 2.5 109 4500 2915 21.1 3960
Volkswagen    Passat          20 21 30 2 134 5800 2685 18.5 2985
Volkswagen    Corrado         23.3 18 25 2.8 178 5800 2385 18.5 2810
Volvo         240             22.7 21 28 2.3 114 5400 2215 15.8 2985
Volvo         850             26.7 20 28 2.4 168 6200 2310 19.3 3245
;
run;

data sasuser.CatalogSales;
  input purchase age gender $ income $;
  datalines;
0 41 Female Low
0 47 Female Low
1 41 Female Low
1 39 Female Low
0 32 Female Low
0 32 Female Low
0 33 Female Low
0 45 Female Low
0 43 Female Low
0 40 Female Low
0 39 Female Low
1 46 Female Low
0 38 Female Low
0 38 Female Low
1 44 Female Low
0 39 Female Low
0 26 Female Low
0 45 Female Low
0 40 Female Low
0 35 Female Low
1 30 Female Low
0 44 Female Low
1 47 Female Low
1 35 Female Low
0 36 Female Low
0 34 Female Low
1 38 Female Low
0 38 Female Low
0 47 Female Low
0 41 Female Low
0 45 Female Low
1 37 Female Low
1 38 Female Low
1 29 Female Low
1 40 Female Low
0 35 Female Low
0 44 Female Low
0 39 Female Low
1 50 Female Low
1 41 Female Low
0 41 Female Low
0 40 Female Low
1 38 Female Low
1 36 Female Low
1 37 Female Low
0 39 Female Low
0 41 Female Low
1 33 Female Low
1 51 Female Low
0 31 Female Low
0 31 Female Low
0 35 Female Low
0 46 Female Low
1 39 Female Low
0 47 Female Low
0 40 Female Low
1 56 Female Low
0 36 Female Low
0 37 Female Low
0 36 Female Low
0 44 Female Low
1 36 Female Low
0 40 Female Low
1 38 Female Low
0 35 Female Low
1 35 Female Low
0 45 Female Low
0 41 Female Low
0 42 Female Low
1 37 Female Low
0 55 Female Low
1 41 Female Low
1 33 Female Low
1 36 Female Low
0 33 Female Low
0 38 Female Low
0 38 Female Low
0 55 Female Low
0 50 Female Low
1 31 Female Low
1 37 Female Low
1 37 Female Low
0 38 Female Low
0 41 Female Low
0 42 Female Low
1 34 Female Low
1 31 Female Low
0 28 Female Low
1 35 Female Low
1 39 Female Medium
0 39 Female Medium
1 34 Female Medium
1 45 Female Medium
0 41 Female Medium
0 42 Female Medium
0 46 Female Medium
0 42 Female Medium
0 33 Female Medium
1 47 Female Medium
1 39 Female Medium
0 41 Female Medium
0 33 Female Medium
0 43 Female Medium
1 31 Female Medium
1 43 Female Medium
0 45 Female Medium
1 48 Female Medium
0 40 Female Medium
1 35 Female Medium
0 33 Female Medium
1 34 Female Medium
1 43 Female Medium
0 35 Female Medium
1 31 Female Medium
0 48 Female Medium
1 36 Female Medium
0 39 Female Medium
0 37 Female Medium
0 40 Female Medium
0 39 Female Medium
1 44 Female Medium
0 35 Female Medium
0 33 Female Medium
1 34 Female Medium
0 50 Female Medium
1 44 Female Medium
0 40 Female Medium
0 36 Female Medium
1 41 Female Medium
1 37 Female Medium
1 38 Female Medium
0 38 Female Medium
1 41 Female Medium
0 36 Female Medium
0 42 Female Medium
1 43 Female Medium
0 43 Female Medium
0 50 Female Medium
0 42 Female Medium
0 42 Female Medium
0 38 Female Medium
0 33 Female Medium
0 39 Female Medium
1 41 Female Medium
1 44 Female Medium
0 42 Female Medium
1 33 Female Medium
1 49 Female Medium
0 40 Female Medium
1 37 Female Medium
0 38 Female Medium
0 36 Female Medium
0 39 Female Medium
1 34 Female Medium
0 44 Female Medium
1 34 Female Medium
0 39 Female Medium
1 38 Female Medium
1 34 Female Medium
1 52 Female Medium
1 41 Female High
0 41 Female High
0 37 Female High
0 45 Female High
0 44 Female High
1 35 Female High
0 30 Female High
0 28 Female High
1 40 Female High
0 33 Female High
1 44 Female High
0 39 Female High
0 42 Female High
0 31 Female High
0 29 Female High
0 49 Female High
1 33 Female High
1 35 Female High
0 34 Female High
1 40 Female High
1 40 Female High
0 32 Female High
1 38 Female High
1 23 Female High
1 49 Female High
1 39 Female High
0 32 Female High
0 43 Female High
1 38 Female High
0 34 Female High
0 38 Female High
0 35 Female High
0 45 Female High
1 28 Female High
1 35 Female High
0 26 Female High
1 38 Female High
1 34 Female High
1 46 Female High
0 35 Female High
0 36 Female High
0 37 Female High
0 48 Female High
0 41 Female High
0 40 Female High
1 51 Female High
1 45 Female High
0 33 Female High
1 37 Female High
1 36 Female High
0 42 Female High
1 51 Female High
1 51 Female High
1 41 Female High
1 26 Female High
1 49 Female High
0 46 Female High
0 41 Female High
0 40 Female High
1 44 Female High
0 35 Female High
0 40 Female High
0 37 Female High
1 32 Female High
1 45 Female High
1 29 Female High
1 41 Female High
1 39 Female High
0 26 Female High
0 30 Female High
1 38 Female High
0 35 Female High
0 39 Female High
0 24 Female High
0 32 Female High
0 46 Female High
1 40 Female High
0 38 Female High
1 42 Female High
0 43 Female High
0 29 Male   Low
0 58 Male   Low
0 40 Male   Low
0 35 Male   Low
0 47 Male   Low
0 33 Male   Low
0 40 Male   Low
0 37 Male   Low
0 37 Male   Low
0 40 Male   Low
0 36 Male   Low
0 32 Male   Low
0 37 Male   Low
1 49 Male   Low
0 38 Male   Low
1 36 Male   Low
0 42 Male   Low
0 44 Male   Low
0 38 Male   Low
0 40 Male   Low
0 41 Male   Low
0 40 Male   Low
0 47 Male   Low
1 39 Male   Low
0 38 Male   Low
0 43 Male   Low
0 46 Male   Low
1 48 Male   Low
1 38 Male   Low
0 35 Male   Low
0 38 Male   Low
0 37 Male   Low
0 32 Male   Low
0 29 Male   Low
1 41 Male   Low
1 39 Male   Low
0 40 Male   Low
1 48 Male   Low
0 37 Male   Low
0 40 Male   Low
0 42 Male   Low
0 42 Male   Low
0 38 Male   Low
0 46 Male   Medium
0 45 Male   Medium
0 33 Male   Medium
0 34 Male   Medium
1 33 Male   Medium
0 42 Male   Medium
1 47 Male   Medium
0 43 Male   Medium
0 35 Male   Medium
0 43 Male   Medium
1 33 Male   Medium
0 26 Male   Medium
0 34 Male   Medium
0 43 Male   Medium
0 41 Male   Medium
0 38 Male   Medium
0 25 Male   Medium
1 45 Male   Medium
0 37 Male   Medium
0 34 Male   Medium
0 39 Male   Medium
0 32 Male   Medium
0 44 Male   Medium
0 39 Male   Medium
0 30 Male   Medium
0 36 Male   Medium
0 45 Male   Medium
0 39 Male   Medium
0 44 Male   Medium
0 47 Male   Medium
0 46 Male   Medium
1 34 Male   Medium
1 38 Male   Medium
0 31 Male   Medium
0 34 Male   Medium
1 33 Male   Medium
0 38 Male   Medium
1 43 Male   Medium
0 43 Male   Medium
1 47 Male   Medium
0 41 Male   Medium
1 37 Male   Medium
1 38 Male   Medium
0 38 Male   Medium
1 35 Male   Medium
0 34 Male   Medium
0 33 Male   Medium
0 40 Male   Medium
0 39 Male   Medium
0 41 Male   Medium
1 44 Male   Medium
0 37 Male   Medium
0 41 Male   Medium
0 45 Male   Medium
0 29 Male   Medium
0 40 Male   Medium
0 40 Male   Medium
0 35 Male   Medium
0 49 Male   Medium
0 40 Male   Medium
0 38 Male   Medium
0 41 Male   Medium
0 35 Male   Medium
0 33 Male   Medium
0 47 Male   Medium
0 36 Male   Medium
0 37 Male   Medium
0 40 Male   Medium
1 44 Male   Medium
0 48 Male   Medium
1 43 Male   Medium
0 41 Male   Medium
0 30 Male   Medium
0 42 Male   High
0 33 Male   High
1 41 Male   High
0 33 Male   High
0 37 Male   High
1 42 Male   High
0 25 Male   High
1 39 Male   High
0 39 Male   High
0 36 Male   High
0 43 Male   High
0 41 Male   High
0 34 Male   High
0 37 Male   High
1 46 Male   High
1 42 Male   High
0 40 Male   High
0 41 Male   High
1 39 Male   High
1 34 Male   High
1 35 Male   High
1 35 Male   High
0 44 Male   High
1 45 Male   High
1 38 Male   High
0 39 Male   High
0 38 Male   High
0 43 Male   High
0 31 Male   High
1 45 Male   High
1 36 Male   High
1 33 Male   High
1 49 Male   High
1 41 Male   High
1 41 Male   High
1 31 Male   High
0 34 Male   High
1 39 Male   High
0 44 Male   High
1 46 Male   High
0 32 Male   High
1 52 Male   High
0 41 Male   High
1 48 Male   High
0 50 Male   High
1 38 Male   High
0 36 Male   High
1 34 Male   High
1 37 Male   High
0 38 Male   High
0 42 Male   High
1 33 Male   High
1 35 Male   High
0 30 Male   High
0 48 Male   High
1 35 Male   High
0 44 Male   High
0 41 Male   High
0 37 Male   High
1 35 Male   High
0 46 Male   High
0 37 Male   High
1 47 Male   High
1 39 Male   High
1 47 Male   High
1 45 Male   High
1 37 Male   High
1 37 Male   High
1 33 Male   High
0 40 Male   High
1 43 Male   High
0 31 Male   High
1 32 Male   High
0 34 Male   High
0 34 Male   High
;
run;

data sasuser.cement;
  infile datalines dsd dlm=' ';
  input Brand : $12. Additive : $10. Strength;
datalines;
Graystone reinforced 32.6
Graystone reinforced 31.5
Graystone reinforced 30.0
Graystone standard 29.8
Graystone reinforced 29.7
Graystone reinforced 29.5
Consolidated reinforced 29.3
"EZ Mix" reinforced 30.2
"EZ Mix" reinforced 28.2
"EZ Mix" standard 28.0
"EZ Mix" standard 28.0
"EZ Mix" reinforced 26.7
Graystone standard 26.4
Consolidated reinforced 26.3
"EZ Mix" reinforced 25.7
"EZ Mix" reinforced 25.5
Consolidated reinforced 25.4
Consolidated reinforced 25.3
"EZ Mix" standard 24.9
Graystone standard 24.6
Graystone standard 24.4
Consolidated standard 24.2
Consolidated standard 23.9
Consolidated reinforced 22.7
Consolidated standard 22.4
Consolidated standard 22.1
"EZ Mix" standard 21.3
Graystone standard 21.2
Consolidated standard 20.4
"EZ Mix" standard 19.8
;

data sasuser.Cereals;
  input brand $ 1-15 @16 weight 7.4 idnumber 24-31;
  datalines;
Morning        14.9982 61469897
Rise n Shine   15.0136 33081197
Morning        15.0100 68137597
Rise n Shine   14.9982 37070397
Morning        15.0052 64608797
Rise n Shine   14.9930 60714297
Morning        14.9733 16907997
Rise n Shine   15.0812 9589297
Morning        15.0037 93891897
Rise n Shine   15.0418 85859397
Morning        14.9957 38152597
Rise n Shine   15.0639 99108497
Morning        15.0099 59666697
Rise n Shine   15.0613 70847197
Morning        14.9943 47613397
Rise n Shine   15.0255 53750297
Morning        14.9779 95948597
Rise n Shine   15.0176 3873197
Morning        14.9862 25756097
Rise n Shine   15.0122 43493297
Morning        14.9907 27543197
Rise n Shine   15.0122 26212897
Morning        14.9785 8945097
Rise n Shine   15.0322 51799397
Morning        15.0716 39196697
Rise n Shine   15.0164 48154497
Morning        14.9787 55189597
Rise n Shine   15.0093 46028397
Morning        14.9935 75332897
Rise n Shine   15.0156 29520797
Morning        15.0270 55983497
Rise n Shine   15.0393 93236497
Morning        14.9855 6975697
Rise n Shine   15.0298 29686297
Morning        14.9982 76815697
Rise n Shine   15.0204 64045497
Morning        15.0194 9880297
Rise n Shine   15.0633 23048597
Morning        14.9720 76058697
Rise n Shine   15.0464 42586897
Morning        14.9793 62688897
Rise n Shine   15.0858 73461797
Morning        15.0304 44327297
Rise n Shine   15.0418 2854197
Morning        15.0187 42401697
Rise n Shine   15.0101 51266697
Morning        15.0134 61195297
Rise n Shine   15.0580 71681397
Morning        14.9930 43230697
Rise n Shine   15.0550 6520097
Morning        14.9690 61728297
Rise n Shine   15.0500 64179097
Morning        14.9955 20494697
Rise n Shine   15.0868 40177297
Morning        15.0032 43183797
Rise n Shine   15.0196 47146397
Morning        14.9737 60633297
Rise n Shine   15.0413 72168497
Morning        15.0254 98377897
Rise n Shine   15.0267 20745097
Morning        14.9885 91775997
Rise n Shine   15.0374 82634897
Morning        15.0223 73772397
Rise n Shine   15.0437 20755897
Morning        15.0057 57288097
Rise n Shine   15.0194 55860697
Morning        15.0039 65246997
Rise n Shine   15.0623 81994397
Morning        14.9515 76526697
Rise n Shine   15.0980 23573597
Morning        14.9894 61160997
Rise n Shine   15.0234 23359697
Morning        15.0169 19108097
Rise n Shine   14.9831 30834797
Morning        14.9803 46806897
Rise n Shine   15.0435 62919297
Morning        14.9730 37534197
Rise n Shine   15.0497 4440297
Morning        14.9779 2012997
Rise n Shine   15.0096 59149297
;
run;

data sasuser.drug;
  input Drug : 1. Disease : $1. Bloodp;
datalines;
1 A 119.70095982
1 A 121.36188924
1 A 119.69180851
1 A 119.60217745
1 A 120.96573695
1 A 119.18963686
1 A 120.04126616
1 A 120.6485107
1 A 121.39677755
1 A 121.2941861
2 A 134.70095982
2 A 136.36188924
2 A 134.69180851
2 A 134.60217745
2 A 135.96573695
2 A 134.18963686
2 A 135.04126616
2 A 135.6485107
2 A 136.39677755
2 A 136.2941861
3 A 139.17670991
3 A 139.7596925
3 A 139.61692792
3 A 139.47841248
3 A 140.32687732
3 A 139.19503074
3 A 139.82084261
3 A 139.33853642
3 A 139.18391356
3 A 141.16519705
4 A 151.0314732
4 A 148.45628664
4 A 150.90924814
4 A 150.36754897
4 A 150.40537109
4 A 150.27207554
4 A 148.84462813
4 A 148.98134213
4 A 148.67342047
4 A 151.22752311
1 B 159.47367321
1 B 157.8492618
1 B 159.71157707
1 B 161.08606542
1 B 157.88059214
1 B 160.70808134
1 B 158.93686029
1 B 159.59337556
1 B 161.04857471
1 B 162.4582518
2 B 149.44343695
2 B 149.51766786
2 B 151.67540302
2 B 148.43104013
2 B 150.04534684
2 B 149.53540532
2 B 149.21944044
2 B 149.29473811
2 B 149.80104295
2 B 150.2553889
3 B 140.84243239
3 B 139.80385608
3 B 140.01491297
3 B 140.84663178
3 B 139.47817427
3 B 139.34930573
3 B 140.06553297
3 B 139.90122485
3 B 140.48542888
3 B 139.48601375
4 B 129.32979505
4 B 130.1515735
4 B 130.44367458
4 B 129.75982193
4 B 129.05742185
4 B 130.10355508
4 B 130.70093917
4 B 130.88766817
4 B 131.63619676
4 B 129.8023949
1 C 126.23902904
1 C 125.75600563
1 C 125.87874742
1 C 125.04661693
1 C 122.97475788
1 C 123.59937382
1 C 125.16139122
1 C 124.73864001
1 C 123.42349457
1 C 125.38733391
2 C 125.69890209
2 C 125.56064272
2 C 123.83433943
2 C 124.6489834
2 C 123.29421225
2 C 125.24488558
2 C 123.753593
2 C 125.1478912
2 C 126.59647236
2 C 124.56548104
3 C 125.09941212
3 C 126.00783602
3 C 123.7285012
3 C 123.81351742
3 C 124.62018186
3 C 124.68909051
3 C 124.86764454
3 C 124.00137446
3 C 125.56161889
3 C 124.01149493
4 C 124.8987427
4 C 124.38445589
4 C 124.91319163
4 C 125.86522746
4 C 123.22694283
4 C 125.61937452
4 C 126.41012761
4 C 125.39699702
4 C 125.05360115
4 C 125.49297642
;


data sasuser.Exact;
  input a b ;
  datalines;
1 2
1 2
1 2
2 1
2 1
2 2
2 2
;
run;

data sasuser.Fitness;
   length Name $ 9;
   input Name $ Gender $ Runtime Age Weight Oxygen_Consumption Run_Pulse
         Rest_Pulse Maximum_Pulse Performance;
   datalines;
Donna    F  8.17  42  68.15  59.57   166   40   172  14
Gracie   F  8.63  38  81.87  60.06   170   48   186  13
Luanne   F  8.65  43  85.84  54.3    156   45   168  13
Mimi     F  8.92  50  70.87  54.63   146   48   155  11
Chris    M  8.95  49  81.42  49.16   180   44   185  11
Allen    M  9.22  38  89.02  49.87   178   55   180  12
Nancy    F  9.4   49  76.32  48.67   186   56   188  10
Patty    F  9.63  52  76.32  45.44   164   48   166  10
Suzanne  F  9.93  57  59.08  50.55   148   49   155   9
Teresa   F 10     51  77.91  46.67   162   48   168   9
Bob      M 10.07  40  75.07  45.31   185   62   185   9
Harriett F 10.08  49  73.37  50.39   168   67   168   9
Jane     F 10.13  44  73.03  50.54   168   45   168   9
Harold   M 10.25  48  91.63  46.77   162   48   164   9
Sammy    M 10.33  54  83.12  51.85   166   50   170   8
Buffy    F 10.47  52  73.71  45.79   186   59   188   8
Trent    M 10.5   52  82.78  47.47   170   53   172   8
Jackie   F 10.6   47  79.15  47.27   162   47   164   8
Ralph    M 10.85  43  81.19  49.09   162   64   170   7
Jack     M 10.95  51  69.63  40.84   168   57   172   7
Annie    F 11.08  51  67.25  45.12   172   48   172   7
Kate     F 11.12  45  66.45  44.75   176   51   176   7
Carl     M 11.17  54  79.38  46.08   156   62   165   7
Don      M 11.37  44  89.47  44.61   178   62   182   6
Effie    F 11.5   48  61.24  47.92   170   52   176   6
George   M 11.63  47  77.45  44.81   176   58   176   6
Iris     F 11.95  40  75.98  45.68   176   70   180   5
Mark     M 12.63  57  73.37  39.41   174   58   176   4
Steve    M 12.88  54  91.63  39.2    168   44   172   4
Vaughn   M 13.08  44  81.42  39.44   174   63   176   2
William  M 14.03  45  87.66  37.39   186   56   192   0
;
run;

data sasuser.Grades;
  input score gpa;
  datalines;
49.4  2.21
41.3  2.09
31.7  1.83
32.4  1.83
78    2.77
72.9  3.2
38.3  2.47
75    3.5
45.6  2.99
90.7  3.7
41.2  2.4
48    1.94
32    1.22
46.2  2.31
22.3  1.5
48.1  2.68
51.8  2.29
28.2  2.01
41.8  1.96
75.6  2.97
23.1  1.88
46.5  2.81
47.9  2.17
34    1.86
49    2.06
;
run;

proc format library=sasuser;
   value vstfmt   0='staff only'
                  1='physician';
   value spcfmt 1='oncologist'
                2='internal med'
                3='family prac'
                4='pulmonolgist'
                5='other special';
   value safdesc   1='Below Average'
                   0='Average or Above';
   value sizename 1='Small'
                  2='Medium'
   			      3='Large';

  value $regfmt
    'WA','OR','CA','NV','ID','HA'='West'
    'MT','WY','UT','ND','SD','NE','KS','CO'='Central'
    'AZ','NM','TX','OK'='Southwest'
    'MN','WI','MI','IL','IA','MO','IN','OH'='Midwest'
    'WV','KY','TN','AR','LA','MS','AL','VA',
    'GA','NC','SC','FL'='South'
    'PA','MD','DE','NJ','NY','CT','RI','MA',
    'NH','VT','ME'='Northeast'
    other='Miscoded';
run;

data Hospice1;
  input id 1-2 visit 4 code1 5 @6 date mmddyy6. ref3p 12 ref2p 13
        ref1p 14 ref1a 15 ref2a 16-17 ref3a 18;

  if ref3p=. then ref3p=0;
  if ref2p=. then ref2p=0;
  if ref1p=. then ref1p=0;
  if ref1a=. then ref1a=0;
  if ref2a=. then ref2a=0;
  if ref3a=. then ref3a=0;
  avgprior = mean(ref3p, ref2p, ref1p);
  diff1 = ref1a-avgprior;
  diff2 = ref2a-avgprior;
  diff3 = ref3a-avgprior;
  diffbys1 = ref1a-ref3p;
  diffbys2 = ref2a-ref3p;
  diffbys3 = ref3a-ref3p;

  label id='physician identification number'
        visit='visit code'
        code1='specialty code'
        date='date of visit'
        ref3p='number referrals 3 mnths prior 2 visit'
        ref2p='number referrals 2 mnths prior 2 visit'
        ref1p='number referrals 1 mnth prior 2 visit'
        ref1a='number referrals 1 mnth after visit'
        ref2a='number referrals 2 mnths after visit'
        ref3a='number referrals 3 mnths after visit'
        avgprior='average # referrals prior 2 visit'
        diff1='# refs 1 mnth after minus average prior'
        diff2='# refs 2 mnth after minus average prior'
        diff3='# refs 3 mnth after minus average prior'
        diffbys1='# refs 1 mnth after minus # 3 mths prior'
        diffbys2='# refs 2 mnth after minus # 3 mths prior'
        diffbys3='# refs 3 mnth after minus # 3 mths prior'
   ;
  datalines;
01 15100695
02 13103195    01
04 13102795  3 011
06 111023951  1
07 131019953 1
08 111030951221  2
10 13110895
13 111005957641046
14 111030952  3011
15 12111095   1011
16 111030954143045
18 12100995
22 11103195  2
23 11103095  1
24 12110195    011
26 11103195724401
27 111011952234023
28 12110395      1
29 111030952 21032
30 13101995   1
31 13103195 111  1
32 12110395      1
33 12100395
34 12100395    01
35 12110395      2
36 111012956161  4
39 11103195 115  1
42 13102095   1
44 1311019511
45 13102595
47 111005956678114
48 13101895
49 111011954223024
50 12102095
51 12102095
52 15102095      1
54 13103095  1
55 12110895   1
56 13101995
57 11101395
60 11112095 211021
61 15103195 211011
62 12111095
63 111012953223033
03 01101395 1
05 031018952412022
09 021017951 13  3
11 03102595
12 011031953411058
17 03103195 1  01
19 03102595  1 012
20 05101795
21 02100995   1
25 05100695
37 03101795    01
38 04103195
40 03102595
41 02112895 11   1
43 05101795
46 05100995
53 02101195 1
58 03110695   1
59 04103195      1
;
run;

data Hospice1;
   set Hospice1;
   where code1 < 4;
run;

data sasuser.Hospice;
   set Hospice1;
   keep id visit code diffbys3;
   rename diffbys3 = difference;
   length code $ 13;
   if code1 = 1 then code = 'Oncologist';
     else if code1 = 2 then code = 'Internal Med';
     else if code1 = 3 then code = 'Family Prac';
     else if code1 = 4 then code = 'Pulmonolgist';
     else if code1 = 5 then code = 'Other Special';
run;

proc datasets library=work nolist;
   delete
      Hospice1;
run;
quit;

data sasuser.Market;
  input pre post @@;
  datalines;
 9.52 10.28  9.63 10.45
 7.71  8.51  7.83  8.62
 8.97 10.03  8.62  9.45
10.11  9.68  9.96  9.62
 8.50 11.84  9.62 11.95
10.29 10.52 10.13 10.67
 9.11 11.03  8.95 10.53
10.86 10.70  9.31 10.24
 9.59 10.82  9.27 10.16
11.86 12.12 10.15 11.28
12.83 13.11 11.40 12.09
11.19 13.43 11.97 14.45
11.47 12.49 10.06 12.26
11.15 10.67 10.74 11.25
 9.99 11.16  7.56  7.33
;
run;

data sasuser.Need_Prediction;
input performance @@;
datalines;
1 3 5 12
;
run;

data sasuser.Paints;
  input road $ 1-12 paint 13-14  bright 15-16;
  datalines;
Main St.    2 64
Main St.    3 62
Main St.    1 47
Main St.    3 54
Elm St.     1 55
Elm St.     3 68
Elm St.     2 79
Elm St.     4 72
Beech St.   2 75
Beech St.   4 71
Beech St.   2 76
Beech St.   4 75
Center St.  4 62
Center St.  1 59
Center St.  4 61
Center St.  1 43
Park Dr.    4 77
Park Dr.    3 63
Park Dr.    1 64
Park Dr.    2 84
Broadway    4 64
Broadway    1 46
Broadway    2 64
Broadway    3 65
Station Rd. 3 67
Station Rd. 1 56
Station Rd. 2 79
Station Rd. 3 67
;
run;

proc sort data=sasuser.Paints;
  by bright;
run;

data sasuser.PaintsBlockedRoad;
  input road $ 1-12 paint 13-14  bright 15-16;
  datalines;
Broadway    1 48
Main St.    1 49
Center St.  1 49
Elm St.     1 57
Station Rd. 1 58
Beech St.   1 60
Park Dr.    1 61
Broadway    2 62
Main St.    2 66
Center St.  2 68
Station Rd. 2 72
Beech St.   2 73
Park Dr.    2 73
Elm St.     2 74
Center St.  3 56
Main St.    3 57
Broadway    3 59
Station Rd. 3 65
Elm St.     3 68
Beech St.   3 69
Park Dr.    3 70
Center St.  4 62
Main St.    4 63
Broadway    4 66
Elm St.     4 73
Station Rd. 4 73
Beech St.   4 75
Park Dr.    4 78
;
run;

proc sort data=sasuser.PaintsBlockedRoad;
  by bright;
run;

data sasuser.RiseCereal;
  input brand $ 1-15 @16 weight 7.4 idnumber 24-31;
  datalines;
Rise n Shine   15.0136 33081197
Rise n Shine   14.9982 37070397
Rise n Shine   14.9930 60714297
Rise n Shine   15.0812  9589297
Rise n Shine   15.0418 85859397
Rise n Shine   15.0639 99108497
Rise n Shine   15.0613 70847197
Rise n Shine   15.0255 53750297
Rise n Shine   15.0176  3873197
Rise n Shine   15.0122 43493297
Rise n Shine   15.0122 26212897
Rise n Shine   15.0322 51799397
Rise n Shine   15.0164 48154497
Rise n Shine   15.0093 46028397
Rise n Shine   15.0156 29520797
Rise n Shine   15.0393 93236497
Rise n Shine   15.0298 29686297
Rise n Shine   15.0204 64045497
Rise n Shine   15.0633 23048597
Rise n Shine   15.0464 42586897
Rise n Shine   15.0858 73461797
Rise n Shine   15.0418  2854197
Rise n Shine   15.0101 51266697
Rise n Shine   15.0580 71681397
Rise n Shine   15.0550  6520097
Rise n Shine   15.0500 64179097
Rise n Shine   15.0868 40177297
Rise n Shine   15.0196 47146397
Rise n Shine   15.0413 72168497
Rise n Shine   15.0267 20745097
Rise n Shine   15.0374 82634897
Rise n Shine   15.0437 20755897
Rise n Shine   15.0194 55860697
Rise n Shine   15.0623 81994397
Rise n Shine   15.0980 23573597
Rise n Shine   15.0234 23359697
Rise n Shine   14.9831 30834797
Rise n Shine   15.0435 62919297
Rise n Shine   15.0497  4440297
Rise n Shine   15.0096 59149297
;
run;

data sasuser.Students;
   length Status $12;
   input Grade ClassYear Status $;
   datalines;
   85.9   1    Returning
   83.5   1    Returning
   92.0   1    Returning
   90.1   1    Returning
   74.0   1    Returning
   74.5   1    Returning
   86.3   1    Returning
   81.6   1    Returning
   81.8   1    Returning
   86.3   1    Returning
   83.0   2    Returning
   77.3   2    Returning
   83.4   2    Returning
   87.1   2    Returning
   90.4   2    Returning
   75.3   2    Returning
   70.3   2    Returning
   88.0   2    Returning
   93.6   2    Returning
   82.9   2    Returning
   94.3   3    Returning
   79.2   3    Returning
   94.8   3    Returning
   75.7   3    Returning
   90.8   3    Returning
   74.6   3    Returning
   88.7   3    Returning
   72.4   3    Returning
   90.7   3    Returning
   90.2   3    Returning
   73.1   4    Returning
   58.3   4    Returning
   76.6   4    Returning
   48.2   4    Returning
   60.9   4    Returning
   65.3   4    Returning
   82.7   4    Returning
   67.2   4    Returning
   69.5   4    Returning
   75.0   4    Returning
   77.3   1    Traditional
   65.0   1    Traditional
   79.6   1    Traditional
   83.5   1    Traditional
   75.5   1    Traditional
   62.0   1    Traditional
   70.8   1    Traditional
   72.4   1    Traditional
   56.9   1    Traditional
   64.0   1    Traditional
   87.9   2    Traditional
   75.5   2    Traditional
   75.2   2    Traditional
   85.1   2    Traditional
   85.4   2    Traditional
   72.5   2    Traditional
   76.1   2    Traditional
   99.3   2    Traditional
   75.9   2    Traditional
   48.8   2    Traditional
   93.1   3    Traditional
   87.0   3    Traditional
   76.7   3    Traditional
   78.8   3    Traditional
   72.9   3    Traditional
   69.7   3    Traditional
   72.8   3    Traditional
   98.9   3    Traditional
   88.1   3    Traditional
   52.6   3    Traditional
   64.3   4    Traditional
   88.5   4    Traditional
   70.6   4    Traditional
   86.9   4    Traditional
   91.4   4    Traditional
   66.8   4    Traditional
   71.1   4    Traditional
   97.4   4    Traditional
   78.3   4    Traditional
   60.8   4    Traditional
   ;
run;

data sasuser.Ulcer (drop=i);
  do group='U','N';
    do i=1 to 30;
      input lysolevl @@;
      output;
    end;
  end;
  datalines;
  .2 10.4   .3 10.9   .4 11.3  1.1 12.4    2 16.2
 2.1 17.6  3.3 18.9  3.8 20.7  4.5 24.0  4.8 25.4
 4.9   40    5 42.2  5.3   50  7.5   60  9.8    .
  .2  5.4   .3  5.7   .4  5.8   .7  7.5  1.2  8.7
 1.5  8.8  1.5  9.1  1.9 10.3    2 15.6  2.4 16.1
 2.5 16.5  2.8 16.7  3.6   20  4.8 20.7  4.8   33
;
run;

data sasuser.USColleges1991;
  length name $ 30;
  input name $ 1-30 state $ 32-33 type $ 35-41
                    rate 43-45    tuition 47-52;
  datalines;
Alfred                         NY private  67   6350
Alvernia                       PA private  70   6202
American International         MA private  62   7734
Atlantic Christian             NC private  64   5690
Auburn                         AL public   63   4428
Austin                         TX private  61   8735
Barker U.                      KS private  55   6410
Barat                          IL private  73   7919
Barber-Scotia                  NC private  70   4000
Baylor                         TX private  90   5620
Bellarmine                     TX private  74   6000
Birmingham-Southern            AL private  70   9084
Bloomsburg U. of Pennsylvania  PA public   68   4480
Bowling Green State            OH public   60   6158
Bradley                        IL private  77   8548
Brigham Young                  UT private  55   2850
Cal Institute of Technology    CA private  75  13495
Cal Polytech- San Luis Obispo  CA public   55   7037
Campbell                       NC private  53   6823
Case Western Reserve           OH private  65  12100
Castleton State                VT public   65   5942
Centenary of Louisiana         LA public   52   6500
Centre                         KY private  73   9290
Chesnut Hill                   PA private  78   7550
City College-City U. of N.Y.   NY public   28   4145
Clarion U. of Pennsylvania     PA public   65   4665
Clemson                        SC public   65   6440
Colorado State                 CO public   50   6589
Columbia U.                    NY private  93  14697
Cook College-Rutgers U.        NJ public   68   7052
Cooper Union                   NY private  84    300
Creighton                      NE private  62   8266
Davidson                       NC private  89  12442
Douglass C.-Rutgers            NJ public   74   6382
Drury                          MO private  50   6950
Duke                           NC private  93  14133
D'Youville                     NY private  60   7530
Eastern Illinois               IL public   59   5258
Emory and Henry                VA private  60    800
Farleigh Dickinson-Rutherford  NJ private  55   8812
Fisk                           TN private  63   5000
Florida Southern               FL private  71   6080
Florida State                  FL public   60   4619
Fontbonne                      MO private  60   6970
Fordham                        NY private  60  10305
Frostburg State                MD public   70   4112
Furman                         SC private  74   9874
Georgia Tech                   GA public   66   6054
GMI Eng. & Mgt. Inst.          MI private  75   7482
Grove City                     PA private  75   4490
Guilford                       NC private  70   9540
Hahnemann                      PA private  85   7275
Hanover                        IN private  60   6200
Harvard                        MA private  95  15530
Harvey Mudd                    CA private  70  13750
Hendrix                        AR private  63   6653
Illinois College               IL private  69   6050
Incarnate Word                 TX private  70   6700
Indiana U. of Pennsylvania     PA public   75   4646
Indiana U.-Bloomington         IN public   59   6841
Iowa State                     IA public   62   6160
James Madison                  VA public   76   6004
Jersey City State              NJ public   60   2903
John Carroll                   OH private  79   8512
Johns Hopkins                  MD private  84  15380
Kansas State                   KS public   52   4681
Keene State                    NH public   60   6145
King's College                 PA private  69   7880
Lake Erie                      OH private  65   7840
La Salle                       PA private  80   9150
Le Moyne                       NY private  74   8410
Livingston College-Rutgers U   NJ public   51   6402
Lock Haven U of Pennsylvania   PA public   60   4622
Loras                          IA private  55   8065
MacMurray                      IL private  62   7650
Manhattan                      NY private  70   8836
Marian                         IN private  70   6558
Marquette                      WI private  71   8284
Mary Washington                VA public   66   5318
Marywood                       PA private  63   7300
MIT                            MA private  87  15690
Meredith                       NC private  66   5310
Miami of Ohio                  OH private  73   7378
Michigan State                 MI public   67   8143
Michigan Technology            MI public   59   6012
Millersville U                 PA public   64   4670
Misericordia                   PA private  80   7900
Molloy                         NY private  68   7350
Montclair State                NJ public   58   3032
Mount Marty                    SD private  55   6215
Mount St Mary                  NY private  68   6835
Mount St Vincent               NY private  80   9050
Nazareth College of Rochester  NY private  69   7400
New College of U of South Fla  FL public   43   5488
New Mexico Inst Mining & Tech  NM public   55   4841
North Carolina State           NC public   59   5792
Notre Dame of Maryland         MD private  68   9000
Ohio U                         OH public   76   5805
Ohio State                     OH public   50   6930
Penn State-University Park     PA public   59   8374
Plymouth State-U of NH         NH public    .   6434
Pomona                         CA private  90  14030
Prescott                       AZ private  68   7505
Princeton                      NJ private  91  15440
Purdue                         IN public   69   6764
Quincy                         IL private  62   8000
Radford                        VA public   75   4076
Rice                           TX private  88   7160
Rosemont                       PA private  70   8350
Rutgers College-Rutgers U      NJ public   72   6390
St Bonaventure                 NY private  68   8487
St John's U                    NY private  65   6860
St Joseph's U                  PA private  75   9450
St Louis University            MO private  63   8480
St Mary's of San Antonio       TX private  64   6840
St Olaf                        MN private  87  11200
St Peter's                     NJ private  65   6038
St Thomas Aquinas              NY private  70   6200
Salisbury State                MD public   65   4016
Seton Hill                     PA private  75   8280
Sheperd                        WV public   67   3544
Shippensburg U  Pennsylvania   PA public   64   4622
Siena                          NY private  74   8270
Slippery Rock                  PA public    .      .
Southwestern U                 TX private  62   8500
Spelman                        GA private   .   6560
Stanford                       CA private  87  14280
State U of NY-Albany           NY public   70   4835
State U of NY-Binghamton       NY public   72   4914
State U of NY-Buffalo          NY public   55   4875
State U of NY-Fredonia         NY public   49   4865
State U of NY-Geneseo          NY public   82   4925
State U of NY-Oneonta          NY public   55   4844
State U of NY-Oswego           NY public   55   4855
State U of NY-Plattsburgh      NY public   56   4839
State U of NY-Potsdam          NY public   58   4825
State U of NY-Stoney Brook     NY public   51   4861
Swarthmore                     PA private  90  15490
Texas A & M                    TX public   68   4146
Texas Christian                TX private  56   7660
Trenton State                  NJ public   65   3795
Trinity University             TX private  75   9676
U  of Akron                    OH public   70   6554
U  of Arizona                  AZ public   60   6552
U  of California-Berkeley      CA public   65   7836
U  of California-Davis         CA public   72   7617
U  of California-Irvine        CA public   50   7712
U  of California-Los Angeles   CA public   63   7518
U  of California-Riverside     CA public   69   7530
U  of California-San Diego     CA public   60   7657
U  of California-Santa Barbara CA public   60   7554
U  of California-Santa Cruz    CA public   49   7729
U  of Chicago                  IL private  79  15135
U  of Colorado-Boulder         CO public   60  10774
U  of Connecticut              CT public   70   7775
U  of Dallas                   TX private  63   7900
U  of Delaware                 DE public   64   7916
U  of Detroit                  MI private  60   8700
U  of Florida                  FL public   60   4630
U  of Georgia                  GA public   55   5751
U  of Hawaii-Manoa             HA public   54   3776
U of Illinois-Urbana-Champaign IL public   71   6408
U of Iowa                      IA public   54   6240
U of Kansas                    KS public   53   4688
U of Kentucky                  KY public   49   4730
U of Lowell                    MA public   65   6685
U of Maine                     ME public   55   6435
U of Maryland-College Park     MD public   43   6508
U of Minnesota-Duluth          MN public   72   5280
U of Minnesota-Morris          MN public   65   6241
U of Minnesota-Twin Cities     MN public   42   6338
U of Mississippi               MS public   54   3241
U of Missouri-Columbia         MO public   54   5813
U of Missouri-Rolla            MO public   53   5743
U of NC-Chapel Hill            NC public   73   5622
U of Notre Dame                IN private  93  12390
U of Pittsburgh                PA public    .   8770
U of Rhode Island              RI public   53   7047
U of Scranton                  PA private  83   8846
U of South Carolina            SC public   60   6400
U of South Dakota              SD public   65   3208
U of South Florida             FL public   50   4080
U of Texas-Austin              TX public   57   4142
U of Tulsa                     OK private  65   7950
U of Virginia                  VA public   90   8136
U of Washington                WA public   56   5433
U of West Florida              FL public   65   4620
U of Madison-Wisconsin         WI public   63   6832
Virginia Military Institute    VA public   65   8730
Virginia Tech                  VA public   64   6231
Wabash                         IN private  81   9800
Wake Forest                    NC private  78   9700
Washington State               WA public   43   5534
Webber                         FL private  76   5415
Wesley                         DE private  70   7255
Western Michigan               MI public   60   5366
West Virginia U                WV public   52   4645
Westminter                     MO private  68   7700
William and Mary               VA public   81   9246
Yale                           CT private  85  15180
;
run;



data sasuser.USColleges1991;
   set sasuser.USColleges1991;
   region= put(state,$regfmt.);
run;

data sasuser.Veneer;
   length brand $ 5;
   input brand $ wear;
   datalines;
Acme  2.3
Acme  2.1
Acme  2.4
Acme  2.5
Champ 2.2
Champ 2.3
Champ 2.4
Champ 2.6
Ajax  2.2
Ajax  2.0
Ajax  1.9
Ajax  2.1
;
run;

data sasuser.VehicleSafety;
   input safety 1 type $ 3-16 region $ 17-30 weight 31-35;

   Size=1*(type='Small' or type='Sports') +
        2*(type='Medium') +
        3*(type='Large' or type='Sport/Utility');

   format safety safdesc. size sizename.;
datalines;
0 Medium        N America     3.395
0 Sport/Utility N America     4.18
0 Medium        N America     3.145
0 Small         N America     2.6
0 Medium        N America     3.085
0 Medium        N America     2.91
0 Sport/Utility N America     4.18
0 Medium        Asia          3.415
0 Medium        N America     3.995
0 Small         N America     2.6
1 Small         N America     2.765
0 Small         Asia          2.665
0 Medium        N America     3.1
0 Medium        N America     3.455
0 Medium        N America     3.055
0 Large         N America     3.45
0 Large         N America     3.64
0 Large         N America     4.195
0 Large         N America     3.985
0 Large         N America     4.48
1 Small         N America     2.765
1 Medium        N America     2.785
1 Medium        N America     2.785
0 Large         N America     4.205
1 Sports        N America     3.35
0 Sports        N America     3.38
0 Sport/Utility N America     5.64
0 Large         N America     3.605
0 Large         N America     3.55
0 Large         N America     3.435
0 Small         N America     3.1
1 Small         N America     2.39
0 Large         N America     3.55
1 Sports        N America     3.235
1 Small         N America     2.565
0 Large         N America     4.01
1 Sports        N America     3.45
1 Sports        N America     2.9
0 Sport/Utility N America     1.44
0 Sport/Utility N America     5.005
0 Sport/Utility N America     5.64
0 Sport/Utility N America     5.343
1 Small         N America     2.51
1 Small         N America     2.065
1 Sport/Utility N America     2.5
1 Small         Asia          2.41
0 Medium        Asia          3.255
1 Sports        Asia          2.865
1 Sports        Asia          2.41
0 Sport/Utility Asia          4.08
0 Medium        Asia          2.865
0 Medium        Asia          3.535
0 Sport/Utility Asia          4.365
0 Sport/Utility Asia          4.08
0 Sport/Utility N America     4.09
0 Sport/Utility N America     3.42
0 Sport/Utility N America     3.21
0 Medium        Asia          3.4
0 Large         N America     4.055
1 Small         Asia          2.895
0 Medium        Asia          2.86
0 Sports        Asia          2.335
0 Sports        Asia          2.865
1 Small         N America     2.535
0 Medium        N America     3.11
0 Large         N America     4.01
1 Small         Asia          2.39
0 Medium        Asia          3.73
1 Medium        Asia          3.025
0 Sports        Asia          3.805
1 Sports        Asia          3.235
1 Small         Asia          2.5
0 Medium        Asia          3.07
1 Medium        Asia          3.05
0 Sports        Asia          3.565
0 Medium        N America     3.1
0 Medium        N America     2.905
0 Medium        N America     3.41
0 Large         N America     3.47
0 Large         N America     3.64
0 Medium        N America     3.035
0 Medium        N America     3.535
0 Large         N America     3.665
1 Sports        N America     3.545
0 Small         N America     2.42
0 Sports        N America     2.42
0 Small         Asia          2.425
0 Medium        Asia          3.04
1 Small         Asia          1.845
1 Sport/Utility Asia          2.805
1 Small         Asia          2.165
1 Small         Asia          2.54
0 Medium        Asia          3.23
1 Medium        Asia          3.32
1 Sports        Asia          2.72
0 Sport/Utility Asia          5.15
;
run;

data paper;
  input amount 1 strength 3-5;
  datalines;
1	2.4
1	2.6
1	2.7
2	2.5
2	2.6
2	2.6
2	2.7
2	2.8
3	2.8
3	2.8
3	3
3	3
4	3
4	2.9
4	2.9
4	3
4	3.1
5	2.9
5	2.9
5	3
5	2.9
5	2.8
;
run;


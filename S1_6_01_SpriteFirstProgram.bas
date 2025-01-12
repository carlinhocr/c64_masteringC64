10 rem sprite first program
20 rem a program to show how sprites work
30 rem step 1 -------------
35 rem load Sprite data to memory all 63 bytes
38 rem each sprite is 24 columns by 21 rows
39 rem so 21 rows of 3 bytes
40 for a = 0 to 62
45 rem read the data from the data statements
50 read b
55 rem use block memory 13 as 832 = 13 * 64 
58 rem poke b on the address 832+a
60 poke 832+a,b
70 next 



1000 REM sprite data line by line 3 bytes for 21 lines
1005 REM each sprite is 24 columns by 21 rows
1006 REM so 21 rows of 3 bytes
1010 DATA 3,0,192
1020 DATA 3,129,192
1030 DATA 0,0,0
1040 DATA 0,0,0
1050 DATA 0,0,0
1060 DATA 0,0,0
1070 DATA 0,0,0
1080 DATA 0,0,0
1090 DATA 0,0,0
1100 DATA 0,0,0
1110 DATA 0,0,0
1120 DATA 0,0,0
1130 DATA 0,0,0
1140 DATA 0,0,0
1150 DATA 0,0,0
1160 DATA 0,0,0
1170 DATA 0,0,0
1180 DATA 0,0,0
1190 DATA 0,0,0
1200 DATA 0,0,0
1210 DATA 0,0,0

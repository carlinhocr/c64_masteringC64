10 rem sprite first program
20 rem a program to show how sprites work
30 rem step 1 -------------
40 rem load Sprite data to memory all 63 bytes
50 rem each sprite is 24 columns by 21 rows
60 rem so 21 rows of 3 bytes
70 for a = 0 to 62
80 rem read the data from the data statements
90 read b
100 rem use block memory 13 as 832 = 13 * 64
110 rem poke b on the address 832+a
120 poke 832+a,b
130 next
140 rem step 2 -------------
150 rem tell the vic-ii where is the data for the sprite
160 rem address 2040 to 2047 are for sprite 0 to 7
170 rem we will use sprite 2 address 2042
180 rem memory block 13
190 poke 2042,13
200 rem step 3 -------------
210 rem specify base address for the vic-ii register 0
220 rem so it will be easier to refer to each register
230 rem by just adding a byte that correspond to the
240 rem register number
250 v = 53248
260 rem step 4 -------------
270 rem turn on sprite 2
280 rem using vic register 21 each bit is the sprite to turn on
290 rem elevated to 2. sprite 7 is 128, sprite 2 is 4
300 rem 7=128 6=64 5=32 4=16 3=8 2=4 1=2 0=1
310 rem to turn on several sprites just add the numbers
320 rem syntax is poke (base number) + register 21, value
330 poke v + 21,4
340 rem step 5 -------------
345 rem clear the screen
360 print "{clear}"
365 rem step 6 -------------
345 rem set border and background color to black color #0
355 poke 53280,0
362 poke 53281,0
370 rem step 7 -------------
380 rem change the sprite colour
390 rem register are v+39 to v+46 for sprites 0 to 7
400 rem we will use register 41 for sprite 2
410 rem we will use the commodore red color number 2
420 poke v + 41,2
430 rem step 8 -------------
440 rem set the y coordinate register 5
445 poke v + 5, 200
450 rem step 9 -------------
440 rem set the x coordinate register 4
450 poke v + 4, 100



900 rem sprite data line by line 3 bytes for 21 lines
910 rem each sprite is 24 columns by 21 rows
920 rem so 21 rows of 3 bytes
930 rem each row is:
940 rem 128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1
950 rem add the number if the sprite pixel is on
1010 DATA 3,0,192
1020 DATA 3,129,192
1030 DATA 3,231,192
1040 DATA 1,231,128
1050 DATA 0,28,0
1060 DATA 7,219,224
1070 DATA 15,255,240
1080 DATA 31,255,248
1090 DATA 57,255,252
1100 DATA 63,255,156
1110 DATA 63,156,252
1120 DATA 31,255,248
1130 DATA 15,243,240
1140 DATA 7,255,224
1150 DATA 7,255,224
1160 DATA 3,159,192
1170 DATA 3,255,192
1180 DATA 1,231,128
1190 DATA 0,255,0
1200 DATA 0,126,0
1210 DATA 0,24,0



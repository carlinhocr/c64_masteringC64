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
190 poke 2040,13
200 poke 2041,13
210 poke 2042,13
220 poke 2043,13
230 rem step 3 -------------
240 rem specify base address for the vic-ii register 0
250 rem so it will be easier to refer to each register
260 rem by just adding a byte that correspond to the
270 rem register number
280 v = 53248
290 rem step 4 -------------
300 rem turn on sprite 0,1,2 and 3 = 1+2+4+8 =15
310 rem using vic register 21 each bit is the sprite to turn on
320 rem elevated to 2. sprite 7 is 128, sprite 0,1,2 and 3 is 15
330 rem 7=128 6=64 5=32 4=16 3=8 2=4 1=2 0=1
340 rem to turn on several sprites just add the numbers
350 rem syntax is poke (base number) + register 21, value
360 poke v + 21,15
370 rem step 5 -------------
380 rem clear the screen
390 print "{clear}"
400 rem step 6 -------------
410 rem set border light gray
420 poke 53280,15
430 rem and background color to black color #0
440 poke 53281,0
450 rem step 7 -------------
460 rem change the sprite colour
470 rem register are v+39 to v+46 for sprites 0 to 7
480 rem we will use register 39,40,41,42 for sprite 0,1,2,3
490 rem we will use the commodore red color number 2
500 poke v + 39,2
510 poke v + 40,2
520 poke v + 41,2
530 poke v + 42,2
540 rem step 8 -------------
550 rem expand various sprites
560 rem sprite 0 remains original
570 rem sprite 1 and 3expand horizontal
580 poke v + 29,(8+2)
590 rem sprite 2 and 3 expand vertical
600 poke v + 23,(8+4)
640 rem step 9 -------------
650 rem animate along x and y coordinates all the screen
660 rem to use all the screen X axis that is 320 pixels long
670 rem we will put the sprite on the 256 position
680 rem using register 16 for sprite 2 value is 4
690 rem 7=128 6=64 5=32 4=16 3=8 2=4 1=2 0=1
700 rem set each sprite on a fiex y coordinate
710 rem y for sprite 0 = v +1, sprite 1= v+3, sprite 2 v+5
720 rem y for sprite 3 = v +7
730 poke v + 1, 50
740 poke v + 3, 100
750 poke v + 5, 150
760 poke v + 7, 200
770 rem animate along the x axis
780 rem y for sprite 0 = v +0, sprite 1= v+2, sprite 2 v+4
790 rem y for sprite 3 = v +6
800 for x = 24 to 255
810 poke v + 0, x
820 poke v + 2, x
830 poke v + 4, x
840 poke v + 6, x
850 next x
860 rem animate x from 256 to 320
870 rem register 16 activate for sprites 0,1,2,3 = 15
880 poke v + 16,15
890 for x = 0 to 63
900 poke v + 0, x
910 poke v + 2, x
920 poke v + 4, x
930 poke v + 6, x
940 next x
950 rem go back along the x axis from 320 to 256
960 for x = 63 to 0 step -1
970 poke v + 0, x
980 poke v + 2, x
990 poke v + 4, x
1000 poke v + 6, x
1010 next x
1020 rem animate along the x set the x from 255 to 24
1030 poke v + 16,0
1040 for x = 255 to 24 step -1
1050 poke v + 0, x
1060 poke v + 2, x
1070 poke v + 4, x
1080 poke v + 6, x
1090 next x
1100 goto 800
1110 rem step 1 -------------
1120 rem data part of step 1
1130 rem sprite data line by line 3 bytes for 21 lines
1140 rem each sprite is 24 columns by 21 rows
1150 rem so 21 rows of 3 bytes
1160 rem each row is:
1170 rem 128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1
1180 rem add the number if the sprite pixel is one (on)
1190 rem
1200 DATA 3,0,192
1210 DATA 3,129,192
1220 DATA 3,231,192
1230 DATA 1,231,128
1240 DATA 0,28,0
1250 DATA 7,219,224
1260 DATA 15,255,240
1270 DATA 31,255,248
1280 DATA 57,255,252
1290 DATA 63,255,156
1300 DATA 63,156,252
1310 DATA 31,255,248
1320 DATA 15,243,240
1330 DATA 7,255,224
1340 DATA 7,255,224
1350 DATA 3,159,192
1360 DATA 3,255,192
1370 DATA 1,231,128
1380 DATA 0,255,0
1390 DATA 0,126,0
1400 DATA 0,24,0
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
210 rem step 3 -------------
220 rem specify base address for the vic-ii register 0
230 rem so it will be easier to refer to each register
240 rem by just adding a byte that correspond to the
250 rem register number
260 v = 53248
270 rem step 4 -------------
280 rem turn on sprite 0,1 = 1+2 =3
290 rem using vic register 21 each bit is the sprite to turn on
300 rem elevated to 2. sprite 7 is 128, sprite 0,1,2 and 3 is 15
310 rem 7=128 6=64 5=32 4=16 3=8 2=4 1=2 0=1
320 rem to turn on several sprites just add the numbers
330 rem syntax is poke (base number) + register 21, value
340 poke v + 21,3
350 rem step 5 -------------
360 rem clear the screen
370 print "{clear}"
380 rem step 6 -------------
390 rem set border light gray
400 poke 53280,15
410 rem and background color to black color #0
420 poke 53281,0
430 rem step 7 -------------
440 rem change the sprite colour
450 rem register are v+39 to v+46 for sprites 0 to 7
460 rem we will use register 39,40,41,42 for sprite 0,1,2,3
470 rem we will use the commodore red color number 2
480 poke v + 39,2
490 poke v + 40,2
500 poke v + 41,2
510 poke v + 42,2
520 rem step 8 -------------
530 rem expand sprites 0 and 1
540 poke v + 29,(2+1)
550 poke v + 23,(2+1)
560 rem step 9 -------------
570 rem print text for sprites to go over
580 print "  "
590 print "            priority sprite"
600 print "  "
610 print "  "
615 print "  "
618 print "  "
619 print "  "
620 print "             priority text"
625 rem step 10 -------------
628 rem set the priority of the sprites
629 rem put sprite 1 behind the test
630 poke v + 27 , 2
635 rem step 11 -------------
640 rem animate along x and y coordinates all the screen
650 rem to use all the screen X axis that is 320 pixels long
660 rem we will put the sprite on the 256 position
670 rem using register 16 for sprite 2 value is 4
680 rem 7=128 6=64 5=32 4=16 3=8 2=4 1=2 0=1
690 rem set each sprite on a fiex y coordinate
700 rem y for sprite 0 = v +1, sprite 1= v+3
710 poke v + 1, 50
720 poke v + 3, 100
730 rem animate along the x axis
740 rem y for sprite 0 = v +0, sprite 1= v+2
750 for x = 24 to 255
760 poke v + 0, x
770 poke v + 2, x
780 next x
790 rem animate x from 256 to 320
800 rem register 16 activate for sprite 0,1 = 1+2 =3
810 poke v + 16,3
820 for x = 0 to 63
830 poke v + 0, x
840 poke v + 2, x
850 next x
860 rem go back along the x axis from 320 to 256
870 for x = 63 to 0 step -1
880 poke v + 0, x
890 poke v + 2, x
900 next x
910 rem animate along the x set the x from 255 to 24
920 poke v + 16,0
930 for x = 255 to 24 step -1
940 poke v + 0, x
950 poke v + 2, x
960 next x
970 goto 750
980 rem step 1 -------------
990 rem data part of step 1
1000 rem sprite data line by line 3 bytes for 21 lines
1010 rem each sprite is 24 columns by 21 rows
1020 rem so 21 rows of 3 bytes
1030 rem each row is:
1040 rem 128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1
1050 rem add the number if the sprite pixel is one (on)
1060 rem
1070 DATA 3,0,192
1080 DATA 3,129,192
1090 DATA 3,231,192
1100 DATA 1,231,128
1110 DATA 0,28,0
1120 DATA 7,219,224
1130 DATA 15,255,240
1140 DATA 31,255,248
1150 DATA 57,255,252
1160 DATA 63,255,156
1170 DATA 63,156,252
1180 DATA 31,255,248
1190 DATA 15,243,240
1200 DATA 7,255,224
1210 DATA 7,255,224
1220 DATA 3,159,192
1230 DATA 3,255,192
1240 DATA 1,231,128
1250 DATA 0,255,0
1260 DATA 0,126,0
1270 DATA 0,24,0
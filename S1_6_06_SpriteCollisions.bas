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
170 rem we will use sprite 2 address 2042 and 0 2040
180 rem memory block 13
190 poke 2040,13
200 poke 2042,13
210 rem step 3 -------------
220 rem specify base address for the vic-ii register 0
230 rem so it will be easier to refer to each register
240 rem by just adding a byte that correspond to the
250 rem register number
260 v = 53248
270 rem step 4 -------------
280 rem clear the screen
290 print "{clear}"
300 rem step 5 -------------
310 rem set border light gray
320 poke 53280,15
330 rem and background color to black color #0
340 poke 53281,0
350 rem step 6 -------------
360 rem change the sprite colour
370 rem register are v+39 to v+46 for sprites 0 to 7
380 rem we will use register 39,41 for sprite 0,2
390 rem we will use the commodore red color number 2
400 poke v + 39,5
410 poke v + 41,10
420 rem step 7 -------------
430 rem expand sprites 0 and 2
440 rem poke v + 29,(4+1)
450 rem poke v + 23,(4+1)
460 rem step 8 -------------
470 rem print text to limit sprites borders
480 for a=0to24
490 print " 5                                   5 "
500 next a
510 rem step 9 -------------
520 rem specify initila positions and activate sprites
530 rem register 21 to activate sprites
540 x=0
550 d=1
560 rem y for sprite 0 = v +1, sprite 2= v+5
570 poke v + 1, 100
580 poke v + 5, 100
590 rem initial x axis coordinates
600 poke v + 0, 30
610 poke v + 4, 255
620 rem activate sprites after specifying positions x and y
630 rem or the will start bumping each other
640 poke v + 21,5
650 rem animate along the x axis and check for a bump
660 rem x for sprite 0 = v +0, sprite 1= v+4
670 x = x + d
680 poke v + 0, x + 30
690 poke v + 4, 255-x
700 rem check if there was a collision against text
710 rem reading register 31
720 rem value 4 is sprite 2 and value 5 is sprite 0 and 2
730 rem value 1 for sprite 0
740 rem if it checks the borders then reverse movement and
750 rem and go towards center again
760 if peek(v+31) = 4 or peek(v+31) = 1 then d = 1
770 rem to check the character position of sprite 0 collisions
780 if peek(v+31) = 1 then gosub 1120
790 rem check if there was a sprite vs sprite collisions
800 rem value 5 is both sprite 2 = 4 and sprite 0 = 1
810 rem reverse the movement as if it was a bump
820 if peek(v+30) = 5 then d = -1
830 goto 630
840 rem step 1 -------------
850 rem data part of step 1
860 rem sprite data line by line 3 bytes for 21 lines
870 rem each sprite is 24 columns by 21 rows
880 rem so 21 rows of 3 bytes
890 rem each row is:
900 rem 128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1,128+64+32+16+8+4+2+1
910 rem add the number if the sprite pixel is one (on)
920 rem
930 DATA 3,0,192
940 DATA 3,129,192
950 DATA 3,231,192
960 DATA 1,231,128
970 DATA 0,28,0
980 DATA 7,219,224
990 DATA 15,255,240
1000 DATA 31,255,248
1010 DATA 57,255,252
1020 DATA 63,255,156
1030 DATA 63,156,252
1040 DATA 31,255,248
1050 DATA 15,243,240
1060 DATA 7,255,224
1070 DATA 7,255,224
1080 DATA 3,159,192
1090 DATA 3,255,192
1100 DATA 1,231,128
1110 DATA 0,255,0
1120 DATA 0,126,0
1130 DATA 0,24,0
1140 c=int(1024+(peek(v+1))/8+(peek(v+0))/8)
1145 rem register 16 is most significant byte for X in case it went over 255
1150 if peek (v+16)=1 then c=c+32
1160 print(peek(v+1))
1170 print(peek(v+0))
1180 print c
1190 return
# 'standard BBN' is the unmodified Cyburt version of the BBN code 
set terminal postscript eps color enhanced "Helvetica" 20

set logscale x
set format x "10^{%L}" 
set format y "%10.1E"
unset key
set xrange [1e-2:1e1]
#set yrange [2.5e-5:6.5e-5]
set yrange [2.45e-5:6.5e-5]
set xlabel "T_{{/Symbol n},dec}/MeV"
set ylabel "D/H" offset +4,+0

set output "bb_abundances_d.eps"
dobsmax=2.57e-5
#dobsmax=5.0e-5
dobsmin=2.49e-5
set arrow 1 from 1e-2,dobsmax to 1e1,dobsmax nohead lc rgb 'blue'
set arrow 2 from 1e-2,dobsmin to 1e1,dobsmin nohead lc rgb 'blue'
set label 3 "obs. D/H=(2.53 +/- 0.04)x10^{-5}" at graph 0.45,graph 0.5 tc rgb 'blue'
set arrow 4 from 1e-2,3.35e-5 to 1e1,3.35e-5 nohead lc rgb 'red'
set label 5 "standard BBN" at graph 0.45,graph 0.6 tc rgb 'red'
#set arrow 6 from 1e-2,3.54e-5 to 1e1,3.54e-5 nohead lc rgb 'green'
#set label 7 "unmodified Timmes BBN" at graph 0.1,graph 0.7 tc rgb 'green'
#set arrow 8 from 1e-2,3.398e-5 to 1e1,3.398e-5 nohead lc rgb 'orange'
#set label 9 "our BBN at {/Symbol m}=0" at graph 0.1,graph 0.8 tc rgb 'orange'
plot "bbang_tdec.dat" u 2:4 w l linetype 1 lc rgb "black" lw 3

unset arrow 1
unset arrow 2
unset label 3
unset arrow 4
unset label 5
#unset arrow 6
#unset label 7
#unset arrow 8
#unset label 9

set format y "%10.3f"
set ylabel "Y" offset +5,+0
#set yrange [0.22:0.246]
set yrange [0.23:0.27]
set output "bb_abundances_y.eps"
yobsmax=0.2562
yobsmin=0.2368
set arrow 1 from 1e-2,yobsmax to 1e1,yobsmax nohead lc rgb 'blue'
set arrow 2 from 1e-2,yobsmin to 1e1,yobsmin nohead lc rgb 'blue'
set label 3 "obs. Y=0.2465 +/- 0.0097" at graph 0.5,graph 0.7 tc rgb 'blue'
set arrow 4 from 1e-2,0.249 to 1e1,0.249 nohead lc rgb 'red' lw 2.0
set label 5 "standard BBN" at graph 0.5,graph 0.8 tc rgb 'red'
#set arrow 6 from 1e-2,0.249 to 1e1,0.249 nohead lc rgb 'green' lw 1.0
#set label 7 "unmodified Timmes BBN" at graph 0.1,graph 0.7 tc rgb 'green'
#set arrow 8 from 1e-2,0.250 to 1e1,0.250 nohead lc rgb 'orange'
#set label 9 "our BBN at {/Symbol m}=0" at graph 0.1,graph 0.8 tc rgb 'orange'
plot "bbang_tdec.dat" u 2:6 w l linetype 1 lc rgb "black" lw 3

unset arrow 1
unset arrow 2
unset label 3
unset arrow 4
unset label 5
#unset arrow 6
#unset label 7
#unset arrow 8 
#unset label 9

set format y "%10.3f"
set yrange [0.725:0.755]
set ylabel "P" offset +5,+0
set output "bb_abundances_p.eps"
set arrow 4 from 1e-2,0.7513 to 1e1,0.7513 nohead lc rgb 'red' lw 2.0
set label 5 "standard BBN" at graph 0.1,graph 0.8 tc rgb 'red'
#set arrow 6 from 1e-2,0.7514 to 1e1,0.7514 nohead lc rgb 'green' lw 1.0
#set label 7 "unmodified Timmes BBN" at graph 0.1,graph 0.7 tc rgb 'green'
#set arrow 8 from 1e-2,0.7504 to 1e1,0.7504 nohead lc rgb 'orange'
#set label 9 "our BBN at {/Symbol m}=0" at graph 0.1,graph 0.8 tc rgb 'orange'
plot "bbang_tdec.dat" u 2:3 w l linetype 1 lc rgb "black" lw 3

unset arrow 4
unset label 5
set format y "%10.1E"
set yrange [1e-9:3.5e-9]
set ylabel "Li/H" offset +4,+0
set output "bb_abundances_li67.eps"
#liobsmax=1.9e-10
#liobsmin=1.3e-10
#set arrow 1 from 1e-2,liobsmax to 1e1,liobsmax nohead lc rgb 'blue'
#set arrow 2 from 1e-2,liobsmin to 1e1,liobsmin nohead lc rgb 'blue'
set label 3 "obs. Li/H=(1.6 +/- 0.3)x10^{-10}" at graph 0.5,graph 0.7 tc rgb 'blue'
set arrow 4 from 1e-2,3.16184e-9 to 1e1,3.16184e-9 nohead lc rgb 'red' lw 2.0
set label 5 "standard BBN" at graph 0.1,graph 0.8 tc rgb 'red'
#set arrow 6 from 1e-2,0.7514 to 1e1,0.7514 nohead lc rgb 'green' lw 1.0
#set label 7 "unmodified Timmes BBN" at graph 0.1,graph 0.7 tc rgb 'green'
#set arrow 8 from 1e-2,0.7504 to 1e1,0.7504 nohead lc rgb 'orange'
#set label 9 "our BBN at {/Symbol m}=0" at graph 0.1,graph 0.8 tc rgb 'orange'
plot "bbang_tdec.dat" u 2:($7+$8) w l linetype 1 lc rgb "black" lw 3

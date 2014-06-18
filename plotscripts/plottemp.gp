#set terminal png size 1000,1000 enhanced
set terminal postscript eps color enhanced "Helvetica" 20

#set output "tdec.png"
set output "tdec.eps"

#set logscale y
set logscale x
set format x "10^{%L}" 
set format y "%1.1f"
unset key
set xrange [1e-12:1e-6]
set yrange [0.0:1.1]
set xlabel "{/Symbol m}_{/Symbol n}/{/Symbol m}_B"
set ylabel "Neutrino Decoupling T_{dec}/MeV"

plot "bbang_numu_post.dat" u 1:2 w l linetype 1 lw 3 lc "black"


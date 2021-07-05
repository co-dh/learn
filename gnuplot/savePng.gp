set terminal push # save current terminal
set terminal png
set output "$0"
replot
set output
set terminal plot

system "ls" 
plot [0:5] sin(x)
plot [][-2:2] sin(x),x,x-(x**3)/6
plot "prices" u 1:2 w l, "" u 1:3 w lp

set terminal png
set output "graph.png"
replot

set terminal aqua 
set output # empty file name send output to screen.
replot

# single blank line is a discontinuity in data, and belong to same data set
# double blank lines separate data sets. 
plot "data.txt" index 0:2:2 w lp  # index 0 to 2(inclusive), step 2
plot "data.txt" index "t=100" w lp # case sensitive, prefix match, first match.
plot "data" every 2 #lines

smooth unique       # sort, average y on same x
smooth frequency    # sum of y
smooth  bezier      # order n(# of data points). pass 1st, last point.
smooth sbezier      # unique, then bezier w
smooth csplines     # unique, then natural cubic splines. Pass all points. 
smooth acsplines    # unique, weighted cubic splines. (using 1:2:weight)

plot "prices" using 1:2 with linespoints,                   \
           "" using 1:2 title "bezier" smooth bezier,       \
           "" using 1:2 title "csplines" smooth csplines 

plot [1975:1995] [40:160] "prices" u 1:2 w p\
    ,"" u 1:2:(1)     smooth acsplines\
    ,"" u 1:2:(1/50.) smooth acsplines\
    ,"" u 1:2:(50.)   smooth acsplines  

3/2 # 1
2 ** 3 # 8 
n! 
% # modulo

help functions
load "/opt/local/share/doc/gnuplot/demo/stat.inc"
plot rand(0) w lp
print rand(0)

# variable. pi already defined. No local variables.
e = 2.71828182845905
sqrt2 = sqrt(2)
euler=0.57721566490153
print pi, e, sqrt2, euler

#functions. At most 10 variables.
f(x)= -x * log(x)
plot f(x)
gauss(x,m,s)=exp(-0.5*((x-m)/s)**2)/sqrt(2*pi*s**2)
binom(n,k)=n!/(k!*(n-k)!)
min(a,b)=(a<b)?a:b

set dummy t #( t will be the independent variable)
plot sin(t)
set dummy x

g(x)=cos(a*x)/a
plot a=1,g(x),a=2, g(x)

show variables
show functions

# complex number
z={1,2}
print z+z, 3*z, sin(z),exp(z), real(z), imag(z)

show version long
show all
show samples
set samples 1000
# will not be displayed
f(x)=abs(x)<1?1:NaN
plot f(x)

# simple data transformation
plot "prices" using 1:(sqrt($2)) with lines, "" using 1:2 with lp
plot "prices" using 1:(($2+$3)/2) with lines, "" using 1:2 with lp, ""using 1:3 with p
plot "prices" using (log($1)):(log($2)) with lines

plot [:12000] "records" u 1:2 title "Men" w p, "" u 1:3 t "Women" w p, 0.14*x, 0.16*x
plot [9:][5:11] "records" u 2:($1/$2) t "Spd/Dist Men" w lp, "" u 3:($1/$3) t "Women" w lp
plot "records" u 2:($1/$2) w lp
plot [:1500] "records" 

# Log plot
(un)set logscale {x}
splot x**2+y**2, x**2-y**2, x*y  

plot "data" skip 2 using 1:2

# Data file format
set datafile fortran # 1d5, 1Q5
set datafile commentschars "!" # line STARTS with !
set datafile separator ":|" # either : or |
set datafile missing "NaN" # required for whitespace separated format. Otherwise it will try to read next column.
# a line can be treated as an empty line if there is not enough column, and cause a break in plot.
set datafile 


# double quoted string with separator

using "Height":"Weight" #header
0 # row numeber (from 0) inside data set. ( double blank)
-1 # line number, reset by single blank line
-2 # current date set index
(expression)
(column(expression)) # column selector
(column("Weight")) # select by column header
(strcol(expr)) # return column expr as string
(strcol("Weight"))
(timecolumn(3, "%Y-%m-%d"))
(valid(int)) # return 1 if column int is valid.


plot for [j:2:24] "data" u 1:j # inline loop

# pseduo files
"" # last file
"-" stdin
"+" generated samples x
"++"  x,y
"< cmd" read from output of cmd
"| cmd" write to cmd
$heredoc

plot "data" u 1:2:(column(-2)) linecolor variable # plot each data set in different color.
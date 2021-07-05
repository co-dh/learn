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
plot "data.txt" i 0:2:2 w lp  # index 0 to 2(inclusive), step 2
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

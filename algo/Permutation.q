
/ return all permutation of x: [any] in order. 2h in Trap: .z.s inside {} changed!
permutation: {$[0=count x; enlist (); raze x(,/:)' .z.s each x except/: x ]}
/ the iteration version
perm: {(1 0#x){raze(1 rotate)scan'x,'y}/x}

\


`c,'(`a`b; `b`a)
(1 rotate)scan `c`a`b

permutation til 3
dbg:{-1 @-3!(x;y;`type; type y; `cnt; count y); y}

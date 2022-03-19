/
Given x: int, return all permutations of [0..x)

Bottom up, and reuse Perm x - 1.
For example, we know Perm 2 is (0 1; 1 0), when build Perm 3, we have
    1,/: 2 3 Perm 2,
    2,/: 2 3 Perm 2
    3,/: 1 2 Perm 2
    
\
/ TODO: i i 1+count[pn], make a unary function f, and do x/f
perm:{ /return all permutation from 0 to x ( inclusive), 0: [[]], 1 return [[0]], 2: (0 1; 1 0), 3: 6 result
    ; pn: enlist ()
    ; i:0
    ; do[x; pn: raze {y,/:(x except y)@/:z }[til i;;pn] each til i+:1]
    ; pn
    }

perm 1
perm 2

    / x except y : [int]
    / (x except y) @pn[0]: [int]@[int] -> [int] 
    / (x except y) @/:pn[0]:  [[int]]
    / x: int

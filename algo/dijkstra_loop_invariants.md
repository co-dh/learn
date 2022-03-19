Some beautiful argumetns using mathematical induction
Dijkstra

#  example 1
    n: N , p: prime, s: sum string n in base p
    m: max m that p**m div n!
    prove: m = (n-s)/(p-1)

# Example 3
Given a A:list[int], find the length of the max no decreasing subsequence (upsequence)
by definition, subsequence of length 0 and 1 are upsequence.
e.g.:    3 1 1 2 5  -> 4

    relation to maintain: k = max len each upsequence of A[0..N]

##  naive:
  O(N* 2**N). for all 2**N subsequence, find the non decreasing one, return it's max lenght.
    
## naive 2:
  if we know the start of a upsequence, we can go over to the right and only choose the element that > last, ...
No that's wrong, see 1,5,1,1
    
## Divide and conquer
  Divide to smaller problems.
  step 1: we have 2 choices, take 3 or not.
if take 3, filter out the rest with x < 3, smaller problem,
if not take 3, f(A[1:]), smaller problem.

## Dijkstra's method
P1 is derived from R by replace constant N with variable n 
```
    invariant P1: k = max len each upsequence in A[0..n] and n in [1..N+1]
    establish P1 for n = 1; #{P1}
    for n in range(1, N+1):
        
        xxx
        # {P1}
   {P1 and n=N}
   
```   
### xxx can be: 
        remember the tail of max len upseq
        if A[n] >= tail:
            k+=1
            tail = A[n]
            
incomplet:e.g.  5 1 1, what if An < tail? should we start a new upseq? Yes.
each upseq have a tail, and length, if An >= any of the tail , tail |= An, leng++ 
but for the same tail, we only care about te largest length, right?
so if An < tail: we record a new upseq with len: 1, tail An
k = max leng
so we have a pair of (len, tail), and we can put it into an array with index as len,
so the array called len2tail


    
    

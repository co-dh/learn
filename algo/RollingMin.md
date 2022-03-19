#
* brutal force: scan min each time. O N*W
* sort window use count sort
* 
## sorted deque
* use a sorted asceding deque,
* when the window is sliding, add A[r] to the dq to the right, after removed all elements > A[r] from dq
* and add A[l] from dq if it's in dq, if it's not in dq, it's removed in step before
* Trick: when add x, remove A where A >=x


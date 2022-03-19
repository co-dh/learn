'''
    A special trie of same lenght of strings, build with defaultdict.
'''
from collections import defaultdict
from functools import reduce

class Trie():
    def __init__(self, strs: list[str], endChar='|', resetDefault=True):
        self.dicts = []
        self.trie = self.T()
        self.end = endChar
        for s in strs:
            if endChar in s:
                raise "end character in word lists"
        self.addStrs(strs)
        if resetDefault:
            self.resetDefault()

    def T(self):
        "recursively defined default dict of default dict of ..."
        self.dicts.append(r := defaultdict(self.T))
        return r

    def add(self, s: str):
        self[s][self.end] = True 

    def addStrs(self, ss: list[str]):
        list(map(self.add, ss))

    def resetDefault(self):
        for d in self.dicts:
            d.default_factory = None

    def __getitem__(self, s:str):
        return reduce(dict.__getitem__, s, self.trie)

    def __contains__(self, s):
        try:
            return self[s + self.end]
        except KeyError:
            return False

    def search(self, s: str, exclude: str) -> list[str]:
        ''' Simple regex search:
            Give a regex like "ab*cd", and an exclue character c, return all string in tree like ab*cd, but not ab<c>cd
        '''
        ts = [('',t.trie)] # tries to check
        for c in s+self.end:
            if c != '*':
                ts = [ (prefix+c,t[c]) for prefix,t in ts if c in t]
            else:
                # since there is only 1 * in the input, when * appears, ts has only 1 element 
                ts = [ (k,v) for k,v in ts[0][1].items() if k != exclude ]
        return list(map(lambda x:x[0][:-1], ts))


ss = ['hot', 'dot', 'dog', 'lot', 'log', 'cog']
t = Trie(ss)
assert t['hot']
assert 'hot' in t

assert t.search('*ot', 'h') == ['dot','lot']
assert t.search('*', 'h') == []




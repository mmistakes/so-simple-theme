---
layout: single
title:  "jupyter notebook 변환하기!"
categories: coding
tag: [python, blog, jekyll]
toc: true
author_profile: false
---

<head>
  <style>
    table.dataframe {
      white-space: normal;
      width: 100%;
      height: 240px;
      display: block;
      overflow: auto;
      font-family: Arial, sans-serif;
      font-size: 0.9rem;
      line-height: 20px;
      text-align: center;
      border: 0px !important;
    }

    table.dataframe th {
      text-align: center;
      font-weight: bold;
      padding: 8px;
    }

    table.dataframe td {
      text-align: center;
      padding: 8px;
    }

    table.dataframe tr:hover {
      background: #b8d1f3; 
    }

    .output_prompt {
      overflow: auto;
      font-size: 0.9rem;
      line-height: 1.45;
      border-radius: 0.3rem;
      -webkit-overflow-scrolling: touch;
      padding: 0.8rem;
      margin-top: 0;
      margin-bottom: 15px;
      font: 1rem Consolas, "Liberation Mono", Menlo, Courier, monospace;
      color: $code-text-color;
      border: solid 1px $border-color;
      border-radius: 0.3rem;
      word-break: normal;
      white-space: pre;
    }

  .dataframe tbody tr th:only-of-type {
      vertical-align: middle;
  }

  .dataframe tbody tr th {
      vertical-align: top;
  }

  .dataframe thead th {
      text-align: center !important;
      padding: 8px;
  }

  .page__content p {
      margin: 0 0 0px !important;
  }

  .page__content p > strong {
    font-size: 0.8rem !important;
  }

  </style>
</head>


# 문자열 분리 및 결합



```python
# split : 문자열 분리
example = 'python,jqery,javascript'
a, b, c = example.split(',')
print(a,b,c)
```

<pre>
python jqery javascript
</pre>

```python
# join : 문자열 결합
colors = ['red','blue','green','yellow']
result = ''.join(colors)
print(result)
```

<pre>
redbluegreenyellow
</pre>

```python
result = ', '.join(colors)
print(result)
```

<pre>
red, blue, green, yellow
</pre>
# List Comprehesion



```python
# 10이하의 짝수 생성
result = [i for i in range(10) if i % 2 == 0]
print(result)
```

<pre>
[0, 2, 4, 6, 8]
</pre>

```python
# if를 앞으로 보내고, else와 함께 사용
result = [i if i%2 ==0 else 10 for i in range(10)]
print(result)
```

<pre>
[0, 10, 2, 10, 4, 10, 6, 10, 8, 10]
</pre>

```python
# 중첩 반복문
word1 = 'ABC'
word2 = 'DEA'
result = [i + j for i in word1 for j in word2]
print(result)
```

<pre>
['AD', 'AE', 'AA', 'BD', 'BE', 'BA', 'CD', 'CE', 'CA']
</pre>

```python
# 중첩 반복문 with filltering
result = [i + j for i in word1 for j in word2 if not(i ==j)]
print(result)
```

<pre>
['AD', 'AE', 'BD', 'BE', 'BA', 'CD', 'CE', 'CA']
</pre>

```python
# 이차원 리스트 - word2의 j가 고정
result = [[i + j for i in word1] for j in word2]
print(result)
```

<pre>
[['AD', 'BD', 'CD'], ['AE', 'BE', 'CE'], ['AA', 'BA', 'CA']]
</pre>

```python
# 이차원 리스트 - word1을 고정하고 싶다면
result = [[j + i for i in word2] for j in word1]
print(result)
```

<pre>
[['AD', 'AE', 'AA'], ['BD', 'BE', 'BA'], ['CD', 'CE', 'CA']]
</pre>

```python
# 백터와 스칼라의 곱
# 8-1 loop (일반 반복문 + 리스트)
import time

start = time.time()

def scalar_vector_product(scalar, vector):
    result = []
    for value in vector :
        result.append(scalar + value)
    return result

iteration_max = 10000

vector = list(range(iteration_max))
scalar = 2

for _ in range(iteration_max):
    scalar_vector_product(scalar, vector)
    
end = time.time()
print(end -start)
```

<pre>
11.221435308456421
</pre>

```python
# 백터와 스칼라의 곱
# 8-2 list comprehension
start = time.time()

iteration_max = 10000

scalar = 2

for _ in range(iteration_max):
    [scalar * value for value in range(iteration_max)]
    

end = time.time()
print(end -start)
```

<pre>
8.586219787597656
</pre>
# enumerate

인덱스를 붙여 리스트 값 추출



```python
for i, v in enumerate(['tic','tac','toe']):
    print(i,v)
```

<pre>
0 tic
1 tac
2 toe
</pre>

```python
dic = {i:j for i,j in enumerate(
    'TEAMLAB is an academic institute located in South Korea'.split())}
print(dic)
```

<pre>
{0: 'TEAMLAB', 1: 'is', 2: 'an', 3: 'academic', 4: 'institute', 5: 'located', 6: 'in', 7: 'South', 8: 'Korea'}
</pre>
# zip

두그룹의 요소들을 서로 엮음



```python
alist = ['a1','a2','a3']
blist = ['b1','b2','b3']
for a, b in zip(alist,blist):
    print(a,b)
```

<pre>
a1 b1
a2 b2
a3 b3
</pre>

```python
ablist = list(zip(alist,blist))
print(ablist)
```

<pre>
[('a1', 'b1'), ('a2', 'b2'), ('a3', 'b3')]
</pre>

```python
a, b, c = zip((1,2,3),(10,20,30),(100,200,300))
print(a,b,c)
```

<pre>
(1, 10, 100) (2, 20, 200) (3, 30, 300)
</pre>

```python
[sum(x) for x in zip(a,b,c)]
```

<pre>
[6, 60, 600]
</pre>

```python
no = [1,2,3,4]
name = ['hong','gil','dong','nim']
dic = {}

for no, name in zip(no,name):
    dic[no] = name
    
print(dic)
```

<pre>
{1: 'hong', 2: 'gil', 3: 'dong', 4: 'nim'}
</pre>

```python
for i, (a,b) in enumerate(zip(alist,blist)):
    print(i,a,b)
```

<pre>
0 a1 b1
1 a2 b2
2 a3 b3
</pre>
# lambda 함수

익명의 함수



```python
f = lambda x,y : x + y
print(f(1,4))
```

<pre>
5
</pre>

```python
print((lambda x,y : x+y)(1,4))
```

<pre>
5
</pre>
# map 함수

시퀀스 자료형의 요소에 같은 함수 적용

mpa(함수,시퀀스 자료)



```python
ex = [1,2,3,4,5]
f = lambda x: x**2
print(list(map(f,ex)))
```

<pre>
[1, 4, 9, 16, 25]
</pre>

```python
# 리스트 컴프리헨션
[x ** 2 for x in ex]
```

<pre>
[1, 4, 9, 16, 25]
</pre>

```python
# 두개 이상의 시퀀스 자료형에도 적용 가능
f = lambda x, y : x+y
list(map(f, ex, ex))
```

<pre>
[2, 4, 6, 8, 10]
</pre>

```python
# 리스트 컴프리헨션
[x + y for x,y in zip(ex,ex)]
```

<pre>
[2, 4, 6, 8, 10]
</pre>

```python
# filltering
list(map(lambda x: x**2 if x % 2 == 0 else x,ex))
```

<pre>
[1, 4, 3, 16, 5]
</pre>

```python
# 리스트 컴프리헨션
[x ** 2 if x % 2 == 0 else x for x in ex]
```

<pre>
[1, 4, 3, 16, 5]
</pre>
# reduce 함수

시퀀스 자료형의 요소에 차례로 함수를 적용하여 결과를 누적/통합

reduce(함수, 시퀀스자료, 초기값)



```python
from functools import reduce
print(reduce(lambda x,y: x+y, [1,2,3,4,5]))
```

<pre>
15
</pre>

```python
# 초기값 부여
print(reduce(lambda x,y: x+y, [1,2,3,4,5],100))
```

<pre>
115
</pre>

```python
# 예제. 최대값 구하기
f = lambda a, b: a if (a>b) else b
print(reduce(f,[1,100,2,55] ))
```

<pre>
100
</pre>
# 별표(*) 사용



```python
# 가변 매개변수
def asterisk_test(a, *args):
    print(a, args)
    print(type(args))
    
asterisk_test(1,2,3,4,5,6)
```

<pre>
1 (2, 3, 4, 5, 6)
<class 'tuple'>
</pre>

```python
# 키워드 가변 매개변수
def asterisk_test(a, **kargs):
    print(a, kargs)
    print(type(kargs))
    
asterisk_test(1, b=2, c=3, d=4, e=5, f=6)
```

<pre>
1 {'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6}
<class 'dict'>
</pre>

```python
# 언패킹
def asterisk_test(a, args):
    print(a, *args)
    print(type(args))
    
asterisk_test(1,(2,3,4,5,6))
```

<pre>
1 2 3 4 5 6
<class 'tuple'>
</pre>

```python
def asterisk_test(a, *args):
    print(a, args)
    print(type(args))
    
asterisk_test(1,*(2,3,4,5,6))
```

<pre>
1 (2, 3, 4, 5, 6)
<class 'tuple'>
</pre>

```python
# 튜플의 언패킹
a, b, c = ([1,2],[3,4],[5,6])
print(a,b,c)
```

<pre>
[1, 2] [3, 4] [5, 6]
</pre>

```python
# asterisk의 사용으로 언패킹
data = ([1,2],[3,4],[5,6])
print(data)
```

<pre>
([1, 2], [3, 4], [5, 6])
</pre>

```python
# zip 함수와 함께 사용
for data in zip(*[[1,2],[3,4],[5,6]]):
    print(data)
    print(sum(data))
```

<pre>
(1, 3, 5)
9
(2, 4, 6)
12
</pre>

```python
# 딕셔너리의 언패킹
def asterisk_test(a,b,c,d):
    print(a,b,c,d)
    
data = {'b':1, 'c':2, 'd':3}
asterisk_test(10,**data)
```

<pre>
10 1 2 3
</pre>

```python
# 다른 예제
def add(a=0, b=0):
    return a+b

d = {'a':2, 'b':3}
print(add(**d))
```

<pre>
5
</pre>

```python
# 또 다른 예제
def test(arg1, arg2, arg3):
    print('arg3:', arg3)
    print('arg2:', arg2)
    print('arg1:', arg1)
    
kwargs = {'arg3':3, 'arg2':'two', 'arg1':1}
test(**kwargs)
```

<pre>
arg3: 3
arg2: two
arg1: 1
</pre>

```python
```

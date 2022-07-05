---
title: Chapter2 2차원 벡터로 그림 그리기
date: 2022-06-24
categories:
- Chapter 2
---


```python
from math import sqrt, pi, ceil, floor
import matplotlib
import matplotlib.patches
from matplotlib.collections import PatchCollection
```


```python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import xlim, ylim
```




```python
dino_vectors = [(6,4), (3,1), (1,2), (-1,5), (-2,5), (-3,4), (-4,4),
    (-5,3), (-5,2), (-2,2), (-5,1), (-4,0), (-2,1), (-1,0), (0,-3),
    (-1,-4), (1,-4), (2,-3), (1,-2), (3,-1), (5,1)
]

draw(
    Points(*dino_vectors)
)
```


![output_3_0](https://user-images.githubusercontent.com/100830660/177180162-a48b0393-a8bf-40a4-9993-d2ac6babad00.png)
    



```python
draw(
    Points(*dino_vectors),
    Segment((6,4),(3,1))
)
```


    
![output_4_0](https://user-images.githubusercontent.com/100830660/177184588-eeeaf9b8-7e4d-4145-8285-cd0e1c1aa934.png)

    



```python
draw(
    Points((2,2),(-1,3)),
    Segment((2,2),(-1,3),color=red)
)
```


    
![output_5_0](https://user-images.githubusercontent.com/100830660/177184713-c720292a-d1b7-471c-a57f-760e94d962d3.png)

    


 - v=(-1,3), w=(2,2)을 플로팅한 후 벡터의 뺄셈을 하면 (-3,1)이 나온다.
이것의 의미는 w에서 왼쪽으로 3, 위쪽으로 1단위 이동하면 v가 나온다는 것이며 이런 벡터를 변위라고 정의한다. 
빨간 선은 두점 사이의 거리를 의미한다.

* 백터의 길이와 백터간의 거리는 모두 방향이 없는 값이다. 백터의 길이와 방향을 알고 있어야 벡터를 식별하고 그 좌표값을 구할수 있다.

## 연습문제


```python
# 연습문제 2.6
U = [-2,0]
V = [1.5,1.5]
W = [4,1]

U+V


```




    (-2, 0, 1.5, 1.5)



#### 백터를 정의한 후 그냥 합 하게 되면 x,y를 각 더한 값이 아닌 전체가 나열된 값이 출력된다.
#### 원하는 것은 x와 y 좌표의 각 합이다. 이를 해결하기 위해 Numpy를 사용하거나 zip()을 사용할 수 있다.


```python
# zip() 사용
U = [-2,0]
V = [1.5,1.5]
W = [4,1]

Z = [i+j for i, j in zip(U,V)]
Z
```




    [-0.5, 1.5]




```python
# Numpy 사용
import numpy as np

U = [-2,0]
V = [1.5,1.5]
W = [4,1]
u = np.array(U)
v = np.array(V)
w = u+v
w

```




    array([-0.5,  1.5])




```python
# 연습문제 2.7
def add(*vectors):
    return(sum([v[0] for v in vectors]), sum([v[1] for v in vectors]))

# 실제 증명
add([1,2],[2,4],[3,6],[4,8])
# 실제로 벡터의 값이 (10,20)이 나오는 것을 확인 할 수 있다.
```




    (10, 20)




```python
# 연습문제 2.8
def translate(translation,vectors):
    return[(translation,v) for i in vectors]

translate((1,1),[(0,0),(0,1),(-3,-3)])
```




    [((1, 1), array([1.5, 1.5])),
     ((1, 1), array([1.5, 1.5])),
     ((1, 1), array([1.5, 1.5]))]



#### 처음 만든 식이다. add를 추가하지 않아 뒤에 이동하는 벡터가 반영되지 않아 계속 (1,1)값이 나오는 것으로 예측된다.


```python
def translate(translation,vectors):
    return[add(translation,v) for i in vectors]

translate((1,1),[(0,0),(0,1),(-3,-3)])
```




    [(2.5, 2.5), (2.5, 2.5), (2.5, 2.5)]



#### add를 분명 추가했는데 전혀 관련이 없는 (2.5,2.5)가 나오는 현상이 생겼다. 다시 식을 살펴보니 for v in이 아닌 for i in으로 설정해 v값이 재대로 반영되지 않는 것 이었다. i가 2.6에서 zip()에서 반영된것으로 생각되는데 z 내부에서 정의한 것인데 여기서 왜 적용되는지는 추후에 생각해보고 반영하겠다.


```python
def translate(translation,vectors):
    return[add(translation,v) for v in vectors]

translate((1,1),[(0,0),(0,1),(-3,-3)])
```




    [(1, 1), (1, 2), (-2, -2)]



#### 값이 문제 예시와 동일하게 나오는 것을 확인했다.


```python
# 연습문제 2.9
u = [1,2]
v = [3,4]
U = np.array(u)
V = np.array(v)

print(U+V, V+U, U*V, V*U)

draw(
    Points((1,2),(3,4)),
    Segment((1,2),(3,4),color = green))
```

    [4 6] [4 6] [3 8] [3 8]
    


    
![output_20_1](https://user-images.githubusercontent.com/100830660/177184764-17bba05c-a283-47fb-8351-195865edbaa6.png)
    



```python

```

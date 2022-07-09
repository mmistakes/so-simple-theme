---
title: Chapter2 벡터 집합 변환하기
date: 2022-06-30
categories:
- Chapter 2
---

```python
from math import sqrt, pi, ceil, floor
import matplotlib
import matplotlib.patches
from matplotlib.collections import PatchCollection


import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import xlim, ylim

blue = 'C0'
black = 'k'
red = 'C3'
green = 'C2'
purple = 'C4'
orange = 'C2'
gray = 'gray'

class Polygon():
    def __init__(self, *vertices, color=blue, fill=None, alpha=0.4):
        self.vertices = vertices
        self.color = color
        self.fill = fill
        self.alpha = alpha

class Points():
    def __init__(self, *vectors, color=black):
        self.vectors = list(vectors)
        self.color = color

class Arrow():
    def __init__(self, tip, tail=(0,0), color=red):
        self.tip = tip
        self.tail = tail
        self.color = color

class Segment():
    def __init__(self, start_point, end_point, color=blue):
        self.start_point = start_point
        self.end_point = end_point
        self.color = color

# helper function to extract all the vectors from a list of objects
def extract_vectors(objects):
    for object in objects:
        if type(object) == Polygon:
            for v in object.vertices:
                yield v
        elif type(object) == Points:
            for v in object.vectors:
                yield v
        elif type(object) == Arrow:
            yield object.tip
            yield object.tail
        elif type(object) == Segment:
            yield object.start_point
            yield object.end_point
        else:
            raise TypeError("Unrecognized object: {}".format(object))

def draw(*objects, origin=True, axes=True, grid=(1,1), nice_aspect_ratio=True,
            width=6, save_as=None):

    all_vectors = list(extract_vectors(objects))
    xs, ys = zip(*all_vectors)

    max_x, max_y, min_x, min_y = max(0,*xs), max(0,*ys), min(0,*xs), min(0,*ys)

    #sizing
    if grid:
        x_padding = max(ceil(0.05*(max_x-min_x)), grid[0])
        y_padding = max(ceil(0.05*(max_y-min_y)), grid[1])

        def round_up_to_multiple(val,size):
            return floor((val + size) / size) * size

        def round_down_to_multiple(val,size):
            return -floor((-val - size) / size) * size

        plt.xlim(floor((min_x - x_padding) / grid[0]) * grid[0],
                ceil((max_x + x_padding) / grid[0]) * grid[0])
        plt.ylim(floor((min_y - y_padding) / grid[1]) * grid[1],
                ceil((max_y + y_padding) / grid[1]) * grid[1])

    if origin:
        plt.scatter([0],[0], color='k', marker='x')

    if grid:
        plt.gca().set_xticks(np.arange(plt.xlim()[0],plt.xlim()[1],grid[0]))
        plt.gca().set_yticks(np.arange(plt.ylim()[0],plt.ylim()[1],grid[1]))
        plt.grid(True)
        plt.gca().set_axisbelow(True)

    if axes:
        plt.gca().axhline(linewidth=2, color='k')
        plt.gca().axvline(linewidth=2, color='k')

    for object in objects:
        if type(object) == Polygon:
            for i in range(0,len(object.vertices)):
                x1, y1 = object.vertices[i]
                x2, y2 = object.vertices[(i+1)%len(object.vertices)]
                plt.plot([x1,x2],[y1,y2], color=object.color)
            if object.fill:
                xs = [v[0] for v in object.vertices]
                ys = [v[1] for v in object.vertices]
                plt.gca().fill(xs,ys,object.fill,alpha=object.alpha)
        elif type(object) == Points:
            xs = [v[0] for v in object.vectors]
            ys = [v[1] for v in object.vectors]
            plt.scatter(xs,ys,color=object.color)
        elif type(object) == Arrow:
            tip, tail = object.tip, object.tail
            tip_length = (xlim()[1] - xlim()[0]) / 20.
            length = sqrt((tip[1]-tail[1])**2 + (tip[0]-tail[0])**2)
            new_length = length - tip_length
            new_y = (tip[1] - tail[1]) * (new_length / length)
            new_x = (tip[0] - tail[0]) * (new_length / length)
            plt.gca().arrow(tail[0], tail[1], new_x, new_y,
            head_width=tip_length/1.5, head_length=tip_length,
            fc=object.color, ec=object.color)
        elif type(object) == Segment:
            x1, y1 = object.start_point
            x2, y2 = object.end_point
            plt.plot([x1,x2],[y1,y2], color=object.color)
        else:
            raise TypeError("Unrecognized object: {}".format(object))

    fig = matplotlib.pyplot.gcf()

    if nice_aspect_ratio:
        coords_height = (ylim()[1] - ylim()[0])
        coords_width = (xlim()[1] - xlim()[0])
        fig.set_size_inches(width , width * coords_height / coords_width)

    if save_as:
        plt.savefig(save_as)

    plt.show()
```


```python
from math import sqrt, sin, cos, atan2

# def add(v1,v2):
#     return (v1[0] + v2[0], v1[1] + v2[1])

def subtract(v1,v2):
    return (v1[0] - v2[0], v1[1] - v2[1])

def add(*vectors):
    return (sum([v[0] for v in vectors]), sum([v[1] for v in vectors]))

def length(v):
    return sqrt(v[0]**2 + v[1]**2)

def distance(v1,v2):
    return length(subtract(v1,v2))

def perimeter(vectors):
    distances = [distance(vectors[i], vectors[(i+1)%len(vectors)])
                    for i in range(0,len(vectors))]
    return sum(distances)

def scale(scalar,v):
    return (scalar * v[0], scalar * v[1])

def to_cartesian(polar_vector):
    length, angle = polar_vector[0], polar_vector[1]
    return (length*cos(angle), length*sin(angle))

def rotate(angle, vectors):
    polars = [to_polar(v) for v in vectors]
    return [to_cartesian((l, a+angle)) for l,a in polars]

def translate(translation, vectors):
    return [add(translation, v) for v in vectors]

def to_polar(vector):
    x, y = vector[0], vector[1]
    angle = atan2(y,x)
    return (length(vector), angle)
```


```python
dino_vectors = [(6,4), (3,1), (1,2), (-1,5), (-2,5), (-3,4), (-4,4),
 (-5,3), (-5,2), (-2,2), (-5,1), (-4,0), (-2,1), (-1,0), (0,-3),
 (-1,-4), (1,-4), (2,-3), (1,-2), (3,-1), (5,1)
]
```


```python
draw(
 Points(*dino_vectors),
 Polygon(*dino_vectors)
)

```


    
![output_3_0](https://user-images.githubusercontent.com/100830660/177185637-740c0062-ddf6-4435-a428-5be7297ebf67.png)
    


#### 이전에 사용한 코드로 다시 공룡을 그리고 이번에는 pi/4 각 만큼 회전한 공룡을 그려보겠다.


```python
rotation_angle = pi/4
dino_polar = [to_polar(v) for v in dino_vectors]
dino_rotated_polar = [(l,angle + rotation_angle) for l, angle in dino_polar]
dino_rotated = [to_cartesian(p) for p in dino_rotated_polar]
draw(
    Polygon(*dino_vectors, color='gray'),
    Polygon(*dino_rotated, color='red'))
    
```


    
![output_5_0](https://user-images.githubusercontent.com/100830660/177185671-5227ae9c-0e7c-4ba2-a3e6-c8a2150616b2.png)
    


#### 본래의 공룡은 회색으로 똑같이 있고, 새로 그린 빨간색 공룡은 pi/4만큼 회전해있는 것을 볼 수 있다.

#### 이번에는 공룡을 회전시킨 후에 평행이동을 하는 것이다. 이번에 사용했던 translate()과 rotate()를 사용해보겠다.


```python
new_dino = translate((8,8), rotate(5*pi/3, dino_vectors))
```


```python
draw(Polygon(*new_dino,color='green'))
```


    
![output_9_0](https://user-images.githubusercontent.com/100830660/177185696-eae621f4-7a9a-40b7-8528-4e367c2e42c2.png)
    



```python
# 연습문제 2.42 
# 각의 크기 만큼 부호가 양이면 반시계, 음이면 시계 방향으로 회전시키는 함수를 정의해라
def rotate(angle, vectors):
    polars = [to_polar(v) for v in vectors]
    return [to_cartesian((l, a+angle)) for l, a in polars]
```


```python
# 연습문제 2.43
# n개의 변을 갖는 정다각형의 모든 꼭짓점을 데카르트 좌표로 리턴하는 함수
# regular_polygon(n)을 정의해라
def regular_polygon(n):
    return [to_cartesian((1,2*pi*k/n)) for k in range(0,n)]
```


```python
draw(Polygon(*regular_polygon(7),color='red'))
```


    
![output_12_0](https://user-images.githubusercontent.com/100830660/177185731-5b1e0c54-33b0-4894-ba5c-bbd67c8b6eac.png)

    



```python
# 연습문제 2.44
# 공룡을 백터(8,8)만큼 평행이동 시킨 뒤, 5*pi/3으로 회전시킨 결과를 나타내라
# 회전 시킨 뒤 평행이동한 것과 결과가 같은지 확인

new_dino = translate((8,8), rotate(5*pi/3, dino_vectors))
# 위에 정의한 new_dino함수가 평행이동 한 뒤 5*pi/3만큼 회전한 결과,
new_new_dino = translate((8,8),dino_vectors)
new_new_dino2 = rotate(5*pi/3, new_new_dino)
```


```python
draw(
    Polygon(*new_dino, color='red'),
    Polygon(*new_new_dino2, color ='blue')
)
```


    
![output_14_0](https://user-images.githubusercontent.com/100830660/177185761-c0a5eef6-8214-476c-8aa4-286104c2f2c9.png)
    


#### 평행이동과 회전이동의 순서를 바꾸면 결과는 달라진다.


```python
# Matplotlib으로 그림그리기

import matplotlib
from matplotlib.patches import Polygon
from matplotlib.collections import PatchCollection
```

#### Polygon, Points, Arrow, Segment 클래스는 생성자를 통해 전달된 데이터만을 가지고 있을 뿐이다. 

#### 예를 보면 Points 클래스는 벡터의 리스트와 색상 키워드 인자만을 받아 저장하는 생성자만을 가지고 있다. 실제 코드를 살펴보면 아래와 같다. list(vectors)와 color만을 받아오는 거을 볼 수 있다.



```python
class Points():
    def __init__(self, *vectors, colors='black'):
        self.vectros = list(vectors)
        self.color = color
```

#### 위에 정의해놓은 draw함수를 살펴보면 전달된 객체 하나하나 모두 그리는 것을 볼 수있다.   
#### for object in objects:
####        if type(object) == Polygon: 부터 보게되면 실제로 객체에 맞춰 해당하는 실행 함수들을 볼 수 있다. 

#### 지금까지는 chapter 2에서 2차원에 대한 내용을 보았다. 
#### 간단하게 요약하자면
* 벡터는 다차원 공간에서 존재하는 수학적 객체이며, 정해진 길이와 방향을 가진다.
* 벡터는 평면 상에서 원점(참조점)에서 상대적인 점과 동등하다.
* 2차원에서 좌표는 평면상의 점의 위치를 측정할 수 있는 순서쌍이다. 튜플(x,y)로 기재하면 수직으로, 수평으로 얼마나 떨어져 있는지 보여준다.
* 벡터합은 첫번째 벡터를 더하기 위해 주어진 두 번째 벡터를 따라 평행이동하는 효과를 갖는다. 
* 벡터에 스칼라곱을 하면 벡터를 배수 만큼 길어지게 하며 본래 벡터와 동일한 선상에 있다.
* 한 벡터에서 다른 벡터를 빼면 첫번째 벡터를 기준으로 두번째 벡터의 상대적인 위치를 알 수 있다.
* 벡터는 길이와 각의 방향으로 명시할 수 있다. 이것은 2차원 벡터의 극좌표이다.
* 삼각함수(sin, cos, tan)는 데카르트 좌표와 극좌표 간의 변환에 사용된다.
* 극좌표로 나타낸 벡터 집합으로 정의된 도형은 각 벡터의 각에 주어진 회전각을 더하거나 빼서 도형을 회전시킬 수 있다. 
* 회전뿐만 아니라 평행이동 역시 동일한 원리로 가능하다.


```python

```

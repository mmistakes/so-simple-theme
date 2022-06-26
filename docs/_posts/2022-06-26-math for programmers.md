```python
from math import tan
tan(45)
```




    1.6197751905438615




```python
from math import tan, pi
tan(pi/4)
```




    0.9999999999999999



### tan(45)으로 검색하게 되면 45도가 아닌 45라디안 값이 출력됨 pi/4가 tan 45도의 값을 출력할 수 있다.


```python
from math import sin,cos
def to_cartesian(polar_vector) :
    length, angle = polar_vector[0], polar_vector[1]
    return(length*cos(angle), length*sin(angle))
```

### 정의 부분을 확인하면 length 즉 몇 단위 이동했는지와 angle인 각도 값을 입력하면 좌표 순서쌍 값으로 리턴을 해준다


```python
# 실제 확인

from math import pi
angle = 37*pi/180
to_cartesian((5,angle))
```




    (3.993177550236464, 3.0090751157602416)



### x값은 대략 4, y 값은 대략 3이 출력되는 것을 볼 수 있다. 

### asin은 아크사인(arcsine)이라고 하는 역삼각함수(inverse trigonometirc function)중 하나로 angle 값을 리턴한다.
### sin(angle)을 입력하면 angle을 리턴해 주는 것


```python
from math import asin
print(sin(1))
print(asin(0.841470984))
```

    0.8414709848078965
    0.9999999985047324
    


```python
from math import sqrt
asin(3/sqrt(13))
```




    0.9827937232473292



### 하지만 한계로는 같은 sin값을 가지고 있는 각은 여러개 존재함으로 본인이 원하는 값이 아닌 다른 각이 출력될 수도 있다는 것이다.

### 동일하게 아크코사인(arccosine)도 확인해보자


```python
from math import acos
acos(-2/sqrt(13))
```




    2.1587989303424644



### 역시 arcsine과 동일하게 accosine도 같은 각이 존재한다. 고로 내가 원하는 angle값이 출력될수도 있지만 아닌 경우도 존재한다.


```python
print(cos(2.158798930))
print(-2/sqrt(13))
print(sin(2.1587893034))
print(3/sqrt(13))
```

    -0.5547001959402817
    -0.5547001962252291
    0.8320556343661613
    0.8320502943378437
    

### math.atan2 함수를 사용하면 좌표를 입력으로 받아 해당 각을 리턴해준다.


```python
from math import atan2
atan2(3,-2)
```




    2.158798930342464



### 삼각함수는 입력이 서로 달라도 같은 결과를 출력할 수 있어서 출력을 역방향으로 넣어도 유일한 입력값으로 돌아갈 수 없다.


```python
def to_polar(vector):
    x, y = vector[0], vector[1]
    angle = atan2(y,x)
    length = sqrt(x^2+y^2)
    return(length,angle)
```

### 이부분은 책과는 다르다
### def to_polar(vector):
####    x, y = vector[0], vector[1]
####    angle = atan2(y,x)
####    return(length(vector),angle)
### 이게 본래의 식이다.
### 하지만 실제 아래 to_polar을 출력하려고 하면 length가 정의되지 않았다는 에러가 떠 length 를 직접 정의해주고, length(vector)부분을 정의에 넣어서 계산 후 값을 받았다


```python
to_polar((1,0))
```




    (1.0, 0.0)




```python
# 연습문제 2.27

#solve1
from math import sqrt
def length(x,y):
    return(sqrt(x^2+y^2))

length(-1.34,2.68)
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-44-3e67b11d2918> in <module>
          6     return(sqrt(x^2+y^2))
          7 
    ----> 8 length(-1.34,2.68)
    

    <ipython-input-44-3e67b11d2918> in length(x, y)
          4 from math import sqrt
          5 def length(x,y):
    ----> 6     return(sqrt(x^2+y^2))
          7 
          8 length(-1.34,2.68)
    

    TypeError: unsupported operand type(s) for ^: 'float' and 'float'


### ^2을 사용하면 에러가 뜨게 된다. 같은 의미인 **을 사용해 진행하였다.


```python
from math import sqrt
def length(x,y):
    return(sqrt(abs(x)**2+y**2))
length(-1.34,2.68)
```




    2.9963310898497184



### 대략 3배가 나오는 것을 확인 할 수 있다.


```python
# 2.27 slove 2
def to_polar(vector):
    x, y = vector[0], vector[1]
    angle = atan2(y,x)
    length = sqrt(x**2+y**2)
    return(length,angle)

to_polar((-1.34,2.68))
```




    (2.9963310898497184, 2.0344439357957027)



### 이전에 만든 함수를 사용해 문제를 풀었다 length의 값이 2.99633으로 위와 동일하게 3배가 나오는 것을 확인할 수 있다.


```python
# 2.28  tan 22의 근사값 확인
tan(22*pi/180)

```




    0.4040262258351568




```python
# 2.29 길이가 15, 37도 백터의 x성분, y성분
length = 15
x = 15*cos(37*pi/180)
y = 15*sin(37*pi/180)
print(x,y)
#대략 (12,9)
```

    11.979532650709393 9.027225347280725
    


```python
# 2.30 sin(125*pi/180) = 0.819, cos(125*pi/180) = -0.574 일때 각 125*pi/180으로 8.5단위 나아간 각과 이동한 경로
x = 8.5*cos(125*pi/180)
y = 8.5*sin(125*pi/180)
print(x,y)

#경로그리기
from matplotlib import pyplot as plt
import numpy as np
plt.xlabel('x')
plt.ylabel('y')
plt.xlim(-10,0)
plt.ylim(0,10)
plt.plot([0,x],[0,y],'r')
plt.show()
```

    -4.875399708983889 6.962792376456433
    


    
![png](output_29_1.png)
    


### 그래프 설명
#### label로 x,y축 설정
#### lim으로 x,y 범위 설정
#### plot으로 시작점과 종료점 설정해 그래프 그리기


```python
# 2.31 0,90,180에서 sin, cos 값 출력
print(sin(0), sin(90*pi/180), sin(180*pi/180)) # 대략 0,1,0
print(cos(0), cos(90*pi/180), cos(180*pi/180)) # 대략 1,0,-1
```

    0.0 1.0 1.2246467991473532e-16
    1.0 6.123233995736766e-17 -1.0
    


```python
# 2.32 
# sin30, cos30, tan30 소숫점 세자리까지 표현, 거리 = 1, 수직거리 = sqrt(3)/2, 수평거리 = 1/2
# 직각삼각형으로서 합당한지
print(sqrt((1/2)**2+(sqrt(3)/2)**2)) # 0.99999999 즉 1이 출력 거리와 1로 같음으로 피타고라스 정리와 성립

sin30 = (sin(30*pi/180))
print(round(sin30,3))
cos30 = (cos(30*pi/180))
print(round(cos30,3))
tan30 = tan(30*pi/180)
print(round(tan30,3))
```

    0.9999999999999999
    0.5
    0.866
    0.577
    


```python
# 2.33 
# 연습문제 2.32의 삼각형을 대칭이동하여 sin60,cos60,tan60 값을 구하는 것
# 2.32 삼각형 거리 = 1, 수평거리 = sqrt(3)/2, 수직거리 = 1/2
# 삼각형을 평행이동해도 각은 변하지 않음 
sin60 = sin(60*pi/180)
print(round(sin60,10))
cos60 = cos(60*pi/180)
print(round(cos60,10))
tan60 = tan(60*pi/180)
print(round(tan60,10))
```

    0.8660254038
    0.5
    1.7320508076
    


```python
# 2.34 
# 50도에 대한 cos 값 = 0.643일떄 sin50, cos60 값을 그림을 그려 해결
# cos 값이 0.643이면 거리는 1, 수평거리는 0.643
# 두개 값을 피타고라스 정리에 대입해 수직거리 계산
print(sqrt(1-(0.643)**2))
# 즉 수직거리는 0.766
sin50 = 0.766/1
cos50 = 0.643/1
tan50 = 0.766/0.643
print(sin50,cos50,tan50)
```

    0.7658661762997502
    0.766 0.643 1.1912908242612752
    


```python
# 2.35
# 각의 크기 116.57을 라디안으로 표현, 탄젠트 값을 계산
print(116.57*pi/180)
print(tan(2.0345))
```

    2.03453030904979
    -1.9997197104066462
    


```python
# 2.36 10라디안/6 각이 어디있는지 설명, cos(10라디안/6), sin(10라디안/6) 값 계산
print(10/6*180)
# 300도가 출력된다. 즉 원점 기준으로 오른쪽 아래에 위치한다.
print(cos(10*pi/6))
print(sin(10*pi/6))
```

    300.0
    0.5000000000000001
    -0.8660254037844386
    


```python
# 2.37 [(cos(5*x*pi/500), 2*pi*x/1000) for x in range(0,1001)]
# 파이썬 코드로 데카트르 좌표로 변환 후 폐곡선을 이루도록 점 1001개을 선분으로 이어 그림그릭
!pip install pygame
import pygame
screen_width = 480 #가로크기
screen_height = 640 #세로크기
screen = pygame.display.set_mode((screen_width,screen_height))

pic = [(cos(x*pi/100), pi*x/500) for x in range(0,1001)] # 주어진 식 약분하여 표현
vectors = [to_cartesian(p) for p in pic] # 데카르트 좌표로 변환
pygame.draw.polygon(screen,*vectors,*vectors,color = 'g')
```

    Requirement already satisfied: pygame in c:\users\jang\anaconda3\lib\site-packages (2.1.2)
    


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-110-4d311d21541f> in <module>
          9 pic = [(cos(x*pi/100), pi*x/500) for x in range(0,1001)] # 주어진 식 약분하여 표현
         10 vectors = [to_cartesian(p) for p in pic] # 데카르트 좌표로 변환
    ---> 11 pygame.draw.polygon(screen,*vectors,*vectors,color = 'g')
    

    TypeError: function takes at most 4 arguments (2004 given)



```python
polar_coords = [(cos(x*pi/100.0), 2*pi*x/1000.0) for x in range(0,1001)]
vectors = [to_cartesian(p) for p in polar_coords]
draw(Polygon(*vectors, color=green))
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    <ipython-input-107-186225cdb277> in <module>
          1 polar_coords = [(cos(x*pi/100.0), 2*pi*x/1000.0) for x in range(0,1001)]
          2 vectors = [to_cartesian(p) for p in polar_coords]
    ----> 3 draw(Polygon(*vectors, color=green))
    

    NameError: name 'draw' is not defined


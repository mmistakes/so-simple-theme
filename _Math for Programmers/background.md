```python
!pip install pygame

import pygame

pygame.init() #초기화 작업(반드시 필요)


#화면크기 설정
screen_width = 480 #가로크기
screen_height = 640 #세로크기
screen = pygame.display.set_mode((screen_width,screen_height))

#화면타이틀 설정
pygame.display.set_caption("Game") #게임이름

#배경이미지 불러오기
background = pygame.image.load("C:/Users/jangs/pygame/background.png")


#이벤트 루프
running = True #게임이 진행중인가?
while running: 
    for event in pygame.event.get(): # 어떤 이벤트가 발생하였는가
        if event.type == pygame.QUIT: # 창이 닫히는 이벤트가 발생하면 아래 실행
            running = False # 게임이 진행중이 아님
    
    #screen.blit(background, (0,0)) # 배경이 나올 좌표값 설정
    screen.fill((125,255,125)) #rgb값으로도 채울수 있음
    
    pygame.display.update() #게임화면을 다시 그리기 반드시 호출해야됨


            
#pygame 종료

pygame.quit()
```

    Requirement already satisfied: pygame in c:\users\jangs\anaconda3\lib\site-packages (2.1.2)
    


```python

```

; 按住win鼠标点击 屏幕点三个点, 就能算出来他们的夹角!!!!!!!!!!!!结果显示3秒. 可以在最后的3000那里自己修改.



#SingleInstance, Force              ; kill old instance
#NoEnv  
                  
  
				  
				  
array := Object()  
pointsize=3

;放一个透明的窗口.









#LButton:: 			    ; windows+鼠标左键.

WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
if (array.length()==0){
MouseGetPos, xpos, ypos 
xpos:=xpos+ X
ypos:=ypos+Y
Gui,1:  -Caption +ToolWindow
Gui,1: Color, Red
Gui,1:Show,x%xpos% y%ypos% w%pointsize% h%pointsize%,GUI:1
;msgbox, %xpos%,%ypos%
; msgbox,%xpos%
; msgbox,%ypos%

array.Push(xpos)
array.Push(ypos)
;msgbox,% array

;;msgbox,% array[1]  ;这个语言数组坐标从1开始!!!!!!!!!!!!!
;;msgbox,% array[2]
return
}
if (array.length()==2){
MouseGetPos, xpos, ypos 
;这时候得到的坐标是根据上一个gui,1的偏移量, 所以恢复原始坐标.
; msgbox,11111,
; msgbox,% array[1]
; msgbox,22222
; msgbox,% array[2]
xpos:=xpos+ array[1]
ypos:=ypos+ array[2]
; msgbox, %xpos%
Gui,2:  -Caption +ToolWindow
Gui,2: Color, Red
Gui,2:Show,x%xpos% y%ypos% w%pointsize% h%pointsize%,GUI:2
; msgbox, %xpos%,%ypos%
array.Push(xpos )
array.Push(ypos )
return
}
if (array.length()==4){
  MouseGetPos, xpos, ypos 
  xpos:=xpos+ array[3]
ypos:=ypos+ array[4]
Gui,3:  -Caption +ToolWindow
Gui,3: Color, Red
Gui,3:Show,x%xpos% y%ypos% w%pointsize% h%pointsize%,GUI:3
array.Push(xpos )
array.Push(ypos )

;下面计算角度.
v1:=array[1]-array[3]
v2:=array[2]-array[4]

v3:=array[5]-array[3]
v4:=array[6]-array[4]

neiji:=v1*v3+V2*v4
neiji:=neiji/sqrt(v1*v1+v2*v2)/sqrt(v3*v3 +v4*v4)
jiaodu:=ACos(neiji)/3.1415926*180
sinzhi:=Sin(ACos(neiji))
ToolTip, %jiaodu%  sin: %sinzhi%
global array
array:=[]
WinClose,Gui
SetTimer, RemoveToolTip, -3000
return
return
}






return

RemoveToolTip:
ToolTip
return






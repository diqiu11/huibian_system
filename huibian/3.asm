assume cs:codesg
//用栈进行数据交换
codesg segment

	dw 123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0978h	//透彻深入理解字节流的关系，好编排
	dw 0,0,0,0,0,0,0,0									//存储单元和存放字节，字单元。
		
start: mov ax,cs	
	   mov ss,ax
	   mov sp,20h	//栈顶可以任意的设置，不可以少于存放数据
	   
	   mov bx,0
	   mov cx,8
	s: push cs:[bx]
	   add bx,2
	   loop s
	   
	   mov bx,0
	   mov cx,8
	s1:pop cs:[bx]
	   add bx,2
	   loop s1
	   
	   mov ax,4c00h
	   int 21h
codesg ends

end start
	
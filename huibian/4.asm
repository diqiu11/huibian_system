assume cs:codesg,ds:date,ss:stack		//多段编写，类似多函数
date segment
		dw 123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0978h
date ends 
stack segment
		dw 0,0,0,0,0,0,0,0
stack ends 
codesg segment
start:	mov ax,stack
		mov ss,ax
		mov sp,20h
		
		mov ax,date
		mov dx,ax
		
		mov bx,0
		mov cx,8
	s:	push [bx]
		add bx,2
		loop s
	
		mov bx,0
		mov cx,8
	s1:	pop [bx]
		add bx,2
		loop s1
	
		mov ax,4c00h
		int 21h
codesg ends 
end start
		
		
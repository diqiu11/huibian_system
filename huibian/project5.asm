assume cs:codesg,ds:date,ss:stack		
date segment
		dw 123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0978h
date ends 
stack segment
		dw 0,0,0,0,0,0,0,0
stack ends 
codesg segment
start:	mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov ax,date
		mov dx,ax
		
		push ds:[0]
		push ds:[2]
		pop ds:[2]
		pop ds:[0]
		
		mov ax,4c00h
		int 21h
codesg ends 
end start
		
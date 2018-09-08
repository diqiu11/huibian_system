assume cs:codesg,ds:datesg,ss:stacksg
datesg segment
		db 'abc             '
		db 'def             '
		db 'ghi             '
		db 'jkl             '
datesg ends

stacksg segment
		db 0,0,0,0,0,0,0,0
stacksg ends

codesg segment
start:	mov ax,stacksg
		mov ss,ax
		mov sp,16
		
		mov ax,datesg
		mov ds,ax
		
		mov bx,0
		mov cx,4
		
	s0:	push cx
		mov cx,3
		mov si,0
	s:	
		mov al,[bx+si]
		add al,11011111B
		mov [bx+si],al
		inc si
		loop s
		
		mov bx,16
		pop cx
		loop s0
		
		mov ax,4c00h
		int 21h
codesg ends
end start
		
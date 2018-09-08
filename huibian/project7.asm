assume cs:codesg,ds:datesg,ss:stacksg
datesg segment
		db '1. student      '
		db '2. stadent      '
		db '3. ssadent      '
datesg ends

stacksg segment
		db '0,0,0,0,0,0,0,0'
stacksg ends

codesg segment
start:	mov ax,datesg
		mov ds,ax
		
		mov ax,stacksg
		mov ss,ax
		mov sp,16
		mov bx,0
	s0:	mov si,3
		mov cx,3
		push cx
		mov cx,4
	s:	
		mov al,[bx+3]
		and al,11011111B
		mov [bx+3],al
		inc bx
		loop s
		
		pop cx
		add bx,16
		loop s0
		
		mov ax,4c00h
		int 21h
codesg ends
end start
		
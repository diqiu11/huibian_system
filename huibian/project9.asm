assume cs:codesg,ds:datesg,ss:stacksg

datesg segment
		db 'welcome to masm!'
		db 00000010B,00100100B,00001001B
datesg ends

stacksg segment
		db 30 dup (0)
stacksg ends

codesg segment
start:	mov ax,datesg
		mov ds,ax
		
		mov ax,stacksg
		mov ss,ax
		mov sp,31
		
		mov cx,16
		mov bx,0
		
	s:	mov al,[bx]
		mov [bx],al
		inc bx
		jmp short s1
		loop s
		
		mov cx,3
		mov bx,16
	s2:	push cx
		mov cx,8
		mov bx,16
	s1:	mov al,[bx]
		mov [bx],al
		inc bx
		loop s1
		jmp short s
		pop cx
		loop s2
		
		
		mov ax,4c00h
		int 21h

codesg ends
end start		
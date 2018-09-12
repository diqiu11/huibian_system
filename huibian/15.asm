assume cs:codesg,ds:datesg,ss:stacksg
datesg segment
		dw 0,0
datesg ends
stacksg segment
		db 128 dup  (0)
stacksg ends
codesg segment
start:	mov ax,stacksg
		mov ss,ax
		mov sp,128
		
		mov ax,datesg
		mov ds,ax
		mov ax,0
		mov es,ax
		
		push es:[9*4]	//[9*4]
		pop ds:[0]
		push es:[9*4+2]
		pop ds:[2]
		
		mov word ptr es:[9*4],offset int9	//安装
		mov es:[9*4+2],cs
		
		mov ax,0b800h
		mov es,ax
		mov ah,'a'
	s:	mov es:[160*12+40*2],ah
		call delay
		inc ah
		cmp ah,'z'
		jna s
		
		mov ax,0
		mov es,ax
		push ds:[0]
		pop es:[9*4]
		push ds:[2]
		pop es:[9*4+2]
		
		mov ax,4c00h
		int 21h
		
delay:	push dx
		push ax
		mov dx,1000h
		mov ax,0
	s1:	sub ax,1
		sbb dx,0
		cmp ax,0
		jne s1
		cmp dx,0
		jne s1
		pop ax
		pop dx
		ret
		
int9:	push ax
		push bx
		push es
		in al,60h
		pushf
		pushf
		pop bx
		and bh,11111100b
		push bx
		popf
		call dword ptr ds:[0]
		
		cmp al,1
		jne int9ret
		mov ax,0b800h
		mov es,ax
		inc byte ptr es:[160*12+40*2+1]
int9ret:pop es
		pop bx
		pop ax
		iret
		
codesg ends
end start
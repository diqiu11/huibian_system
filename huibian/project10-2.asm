assume cs:code,ds:data,ss:stack
data segment
		db 10 dup (0)
data ends

stack segment
		db 128 dup (0)
stack ends

code segment
start:	mov ax,12666
		mov bx,data
		mov ds,bx
		mov si,0
		mov bx,stack
		mov ss,bx
		mov sp,16
		call dtoc
		
		mov dh,8
		mov dl,3
		mov cl,2
		call show_str
		
		mov ax,4c00h
		int 21h
dtoc:	push si
		push dx
		push ax
		push ss
		push cx
		push bx
		
		mov di,0
		mov bx,10
change0:
		mov dx,0
		
				;余数怎么处理
		div bx
		add dx,30h
		push dx
		inc di
		mov cx,ax
		jcxz ok0
		jmp short change0
ok0:	mov cx,di
	s1:	pop ax
		mov [si],al
		inc si
		loop s1
		pop bx
		pop cx
		pop ss
		pop ax
		pop dx
		pop si
		ret
show_str:
		push si
		push dx
		push ax
		push ss
		push cx
		
		mov ax,0B800H
		mov es,ax
		
		mov al,0a0h
		dec dh
		mul dh
		mov bx,ax
		
		mov al,2
		dec dl
		mul al
		add bx,ax
		
		mov di,0
		mov si,0
		mov al,cl
change:	mov ch,0
		mov cl,ds:[si]
		jcxz ok
		mov ch,al
		mov es:[bx+di],cx
		add di,2
		inc si
		jmp short change
	ok:	pop cx
		pop ss
		pop ax
		pop dx
		pop si
		ret
code ends
end start
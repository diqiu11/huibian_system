assume cs:codesg,ds:datesg,ss:stacksg

datesg segment
		db 'welcome to masm!',0
datesg ends

stacksg segment
		db 16 dup (0)
stacksg ends

codesg segment
start:	mov ax,datesg
		mov ds,ax
		
		mov dh,8
		mov dl,3
		mov cl,2
		
		mov si,0
		
		mov ax,stacksg
		mov ss,ax
		mov sp,0
		
		call show_stf
		
		mov ax,4c00h
		int 21h
		
show_stf:
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
		mov cl,ds:[di]
		jcxz ok
		mov ch,al
		mov es:[bx+si],cx
		add si,2
		inc di
		jmp short change
	ok:	pop cx
		pop si
		pop ax
		pop dx
		pop ss
		ret
codesg ends
end start
assume cs:codesg
codesg segment
start:	mov al,8
		out 70h,al  //70h?
		in al,71h
		
		mov ah,al
		mov cl,4
		shr ah,cl
		shl al,cl
		
		add ah,30h
		add al,30h
		
		mov ax,0b800h
		mov es,ax
		mov byte ptr es:[160*12+40*2],ah
		mov byte ptr es:[160*12+40*2+2],al
		
		mov ax,4c00h
		int 21h
		
codesg ends
end start
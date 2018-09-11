assume cs:code
code segment
start:	mov ax,0b800h		//0b800h是文本模式下显存起始地址；0a000h是图形模式下显存起始地址；起始地址之后的一段内存数据决定了界面上显示的文字、图形、前背景色
		mov es,ax
		mov di,160*12
		mov bx,offset s-offset se	//offset取偏移地址		表示 S 到 SE的偏移距离 
		mov cx,80
	s:	mov byte ptr es:[di],'!'	//将！数据（可以为寄存器）送入以es为基址，di为偏移量所指的地址中去，以字节为单位
		add di,2	
		int 7ch
	se:nop
		mov ax,4c00h
		int 21h
		
code ends
end start
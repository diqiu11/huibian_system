assume cs:code
code segment
		mov ah,2
		mov bh,0
		mov dh,5
		mov dl,12
		int 10h
		
		mov ax,9
		mov al,'a'
		mov bl,11001010B
		mov bh,0
		mov cx,3
		int 10h
		
		mov ax,4c00h
		int 21h
code ends
end
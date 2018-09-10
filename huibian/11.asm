assume cs:codesg,ds:datesg		//条件跳转指令使用
datesg segment
		db "Beginner 's All-purpose Symbolic Instruction Code.",0
datesg ends

codesg segment
begin:	mov ax,datesg		
		mov ds,ax
		mov si,0
		call letterc
		
		mov ax,4c00h
		int 21h


letterc:
		push ax
		push si		//入栈避免寄存器冲突
comp:	mov al,[si]		//因为是db类型，可以用低8为寄存器存放
		cmp al,0	//比较al是否为0
		je exit		//为0则跳转
		cmp al,'a'	//比较字符串是否小于a
		jb next_char	//小于a时跳转	jb为小于
		
		cmp al,'z'
		ja next_char	//大于z时跳转	ja为大于
		and al,11011111B
next_char:
		inc si
		jmp short comp
		
exit:	pop si
		pop ax
		
codesg ends
end begin
assume cs:code


code segment
start:	mov ax,0
		mov es,ax
		mov di,200h		//目标地址
		
		mov ax,cs
		mov ds,ax
		mov si,offset do0		//源地址
		
		
		
		mov cx,offset do0end-offset do0		//do0end是为了测量代码长度而设置的，这里的cx代表执行子中断程序的长度
		cld
		rep movsb			//rep控制串长度		move string byte	字符串传送指令，这条指令按字节传送数据，用si和di，复制作用
		mov ax,4c00h
		int 21h

do0:	jmp short do0start		//防止除法溢出
		db 'overflow!'
		
do0start:	
		mov ax,0b800h
		mov es,ax
		mov di,12*160+36*2		//中间位置
		mov ax,cs
		mov ds,ax
		mov si,202h		//?
		mov cx,9
	s:	mov al,[si]
		mov es:[di],al
		inc si
		add di,2
		loop s
		
		mov ax,4c00h
		int 21h
do0end:	nop
code ends
end start
assume cs:codesg
codesg segment
		
		mov ax,4c00h		//6.返回此处结束
		int 21h
		
start:	mov ax,0		//1.开始执行
	s:	nop		//5.第二轮机器码变成了jmp  0000
		nop
		
		mov di,offset s			//2.到达这一段时，指令发生了变换
		mov si,offset s2
		mov ax,cs:[si] 
		mov cs:[di],ax			//3. s2的指令覆盖到s中了
		
	s0:	jmp short s				//4.执行后返回s
	
	s1:	mov ax,0
		int 21h
		mov ax,0
		
	s2:	jmp short s1
		nop
codesg ends
end start
assume cs:codesg,ds:datesg

datesg segment
		db 'welcome to masm!'
		db 16 dup (0)
datesg ends

codesg segment
start:		mov ax,datesg
		mov ds,ax
		mov si,0
		mov es,ax
		mov di,0
		mov cx,16
		cld		//������ 	std������,����ʱҪ����ƫ�Ƶ�ַΪ����ĵ�ַ������
		rep movsb
		
		mov ax,4c00h
		int 21
codesg ends
end start
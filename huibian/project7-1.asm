assume cs:code,es:table,ds:data,ss:stack
data    segment   
    db    '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'   
    db    '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'   
    db    '1993', '1994', '1995'  
  
    dd    16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514   
    dd    345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000   
  
    dw    3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226   
    dw    11542, 14430, 15257, 17800   
data    ends   
  
table    segment   
    db    21 dup ('year summ ne ?? ')   
table    ends   

stack segment
	dw 8 dup (0)
stack ends

code segment 
start:
	mov ax,data
	mov ds,ax
	
	mov ax,table
	mov es,ax
	
	mov ax,stack
	mov ss,stack
	mov sp,16
	
	mov bx,0
	mov si,0
	mov cx,21
	push bx
	push si
	push cx
	

s:	mov cx,4
	mov bx,0
	mov si,0
s1:	mov ax,ds:[bx]
	mov es:[si],ax
	inc bx
	inc si
	loop s1
	mov cx,4
s2:	mov ax,ds:[bx+1]
	mov es:[si+1],ax
	inc bx
	inc si
	loop s2
	mov cx,2
s3:	mov ax,ds:[bx+1]
	mov es:[si+1],ax
	inc bx
	inc si
	loop s3
	mov cx,2
s4:	push cx
	push bx
	push si
	mov cs,21
	mov bx,0
	mov si,0
s5:	mov ax,ds:[bx+5]
	div ax,es:[si+5]
	add bx,16
	add si,16
	loop s5
	pop si
	pop bx
	pop cx
	loop s4
	
	pop si
	pop bx
	add bx,16
	add si,16
	loop s
	mov ax,4c00h
	int 21h
code ends
start end
	
	
	
	
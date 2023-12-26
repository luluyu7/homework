.data
stringA BYTE "asdterDXRT345*!@as4",0
arrayS BYTE 4 dup(?)
.code
main proc
	
	mov esi,offset stringA
	mov ecx,lengthof stringA
	mov edi,offset arrayS
	sub esi,type stringA
L1:
	;循环遍历一遍
	add esi,type stringA
	mov al,[esi]
	cmp al,'a'	;有可能是小写
	jae L2
	cmp al,'A'	;65-90是大写字母的范围
	jae L3
	cmp al,'0'	;是数字
	jae L4
	loop L1
L2:
	cmp al,'z'
	ja L5
	;如果是小写
	sub al,32
	mov [esi],al
	;add esi,type stringA
	loop L1
L3:
	cmp al,'Z'
	ja L5
	add al,32
	;如果是大写
	mov [esi],al
	;add esi,type stringA
	loop L1
L4:
	cmp al,'9'
	ja L5
	;如果是数字
	sub al,'0'
	mov [edi],al
	add edi,type arrayS
	loop L1
L5:
	loop L1
	
main endp
end main
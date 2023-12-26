.386
.model flat,stdcall
.stack

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib

.data
A dd 567fh,78ffh,4c6ah,90a4h,6abch,0f56ah
B dd lengthof A dup(?)
.code
main proc
	mov esi,offset A	;esi指向数组A
	mov ecx,lengthof A	;数组的长度，循环次数
	mov edi,offset B	;edi指向数组B
L1:
	;数组循环复制
	mov eax,[esi]	;将数据暂存在eax中
	mov [edi],eax
	add esi,type A	;指向下一个数据
	add edi,type B
	loop L1
	
	mov esi,offset A	;esi指向数组A
	mov ecx,lengthof A	;数组的长度，循环次数
	mov edi,offset B	;edi指向数组B
	
L2:
	;移位,A中每个数据左移两位，B中每个右移两位
	mov eax,[esi]
	sal eax,2
	mov [esi],eax
	mov eax,[edi]
	sar eax,2
	mov [edi],eax
	add esi,type A	;指向下一个数据
	add edi,type B
	loop L2
	
	
	mov esi,offset A	;esi指向数组A
	mov ecx,lengthof A	;数组的长度，循环次数
	mov edi,offset B	;edi指向数组B
	
L3:
	;对应的数据进行异或运算
	mov eax,[esi]
	mov ebx,[edi]
	xor eax,ebx
	mov [esi],eax
	add esi,type A	;指向下一个数据
	add edi,type B
	loop L3
	

main endp
end main
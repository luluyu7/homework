.386
.model flat,stdcall
.stack

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib

.data
array10 word 1000h,2000h,3000h,4000h,5000h,6000h,7000h,8000h,9000h,0A000h
lpText byte "I am text",0
lpCaption byte  "I am caption",0
.code
subProc proc
	push edi		;ediָ���ӳ����������
	push ebp
	mov ebp,esp
	mov esi,[ebp+16]	;esiָ������
	mov ecx,[ebp+12]	;ecxΪ���鳤��
	;����10��word���ȵĵ�ַ
	sub ebp,10*type word
	mov edi,ebp
L1:
	mov ax,[esi]
	mov [edi],ax
	add esi,type word
	add edi,type word
	loop L1
	pop ebp
	pop edi
	ret

subProc endp
main proc
	mov esi,offset array10
	push esi
	mov ecx,lengthof array10
	push ecx
	
	invoke subProc
	
	; MessageBox����������User32.dll��
	invoke MessageBox,NULL,addr lpText,addr lpCaption,MB_OK
	invoke ExitProcess,0
	
main endp


end main
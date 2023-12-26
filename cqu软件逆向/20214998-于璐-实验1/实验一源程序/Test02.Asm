.386
.model flat,stdcall
.stack

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib
.data
val1 dd 76h
val2 dd 3450h
val3 dd 1234h
val4 dd 2345h 
result dd ?
.code
main proc
	mov eax,val1
	add eax,val2	;76+3450
	mul val3	;(eax)*1234
	div val4	;(eax)*1234
	mov result,eax

main endp
end main
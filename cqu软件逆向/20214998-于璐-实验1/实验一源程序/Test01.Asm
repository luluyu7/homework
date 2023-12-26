.386
.model flat,stdcall
.stack

include windows.inc
include user32.inc
include kernel32.inc

includelib user32.lib
includelib kernel32.lib


.code
main proc
	
	mov ax,7ff0h
	add al,10h
	add ah,1
	add ax,2

main endp
end main
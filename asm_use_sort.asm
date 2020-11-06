format ELF64

include 'win64axp.inc' 

public main as 'main'
; libc
extrn 'printf' as printf
extrn 'puts' as puts
extrn 'exit' as exit
; my function
extrn 'sort' as sort_func

section '.data' writeable align 32
msg1 db "%i",0xD,0xA,0
msg2 db "Sorted array:",0xD,0xA,0
msg3 db "Array:",0xD,0xA,0
arr_sz dq 5
 align  16 
arr1:
	dq 1
	dq 3
	dq 2
	dq 10
	dq 7

section '.text' executable
main:
    sub     rsp, 0x28 ; Align stack and reserve shadow space.
    mov	rcx, msg3
    call	printf

	mov rsi, 0
	mov rbx, [arr_sz]
	loop1:
		mov	rcx, msg1
		mov	rdx, [arr1+8*rsi]
		call	printf

		add rsi, 1
		cmp rsi, rbx
		jb loop1
	
	mov	rcx, [arr_sz]
	mov	rdx, arr1
	call	sort_func
	
	mov	rcx, msg2
	call	printf

	mov rsi, 0
	mov rbx, [arr_sz]
	loop2:
		mov	rcx, msg1
		mov	rdx, [arr1+8*rsi]
		call	printf

		add rsi, 1
		cmp rsi, rbx
		jb loop2

	xor	rcx, rcx
	call    exit

format ELF64

section '.text' executable

public sort

; sort array elements function 
; Windows x64 calling convention: 
; arr_size --> rcx
; arr --> rdx
;

sort:

    ;c calling convention
    push rbp
    mov rbp, rsp
    push rdx
    push rcx

	mov rax, 0
	mov rsi, rcx
	dec rsi
	loop1:
		mov rbx, rax
		inc rbx
		loop2:
		    mov rdi, [rdx+8*rax]
		    mov r12, [rdx+8*rbx]
			cmp rdi, r12
			jb .noswap
			mov [rdx+8*rax], r12
			mov [rdx+8*rbx], rdi
			.noswap:
			inc rbx
			cmp rbx, rcx
			jb loop2
		
		inc rax
		cmp rax, rsi
		jb loop1

	add rsp, 16
	mov rsp, rbp
	pop rbp

	ret

section '.data' writeable

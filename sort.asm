format ELF64

section '.text' executable

public sort

; sort array elements function 
; Windows x64 calling convention: 
; arr_size --> rcx
; arr --> rdx
;

sort:
; We do not call other functions so stack aligning  
; and stack frame are unnecessary. Looks like shadow space 
; should be reserved so we also align the stack
	sub rsp, 0x20 + 0x08
	mov rax, 0
	mov rsi, rcx
	dec rsi
	loop1:
		mov rbx, rax
		inc rbx
		loop2:
		    mov rdi, [rdx+8*rax]
		    mov rbp, [rdx+8*rbx]
			cmp rdi, rbp
			jb .noswap
			mov [rdx+8*rax], rbp
			mov [rdx+8*rbx], rdi
			.noswap:
			inc rbx
			cmp rbx, rcx
			jb loop2
		
		inc rax
		cmp rax, rsi
		jb loop1
	add rsp, 0x20 + 0x08
	ret

section '.data' writeable
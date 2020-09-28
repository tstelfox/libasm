; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/23 16:25:49 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/26 15:42:06 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global	_ft_write
	section	.text
	extern	___error
_ft_write:
	mov		rax, 0x2000004	; Set rax to system call for write
	syscall					; Call write
	jc		error			; Failed system call in x64 for mac os sets carry flag
	ret

error:
	push	rax			; Push rax onto the stack
	call	___error	; The fuck is this shit
	mov		rdi, rax	; address of errno saved in rdi
	pop		rax
	mov		[rdi], rax	; Set original error value of rax to address of errno
	mov		rax, -1		; return -1
	ret

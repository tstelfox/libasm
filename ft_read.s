; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/26 15:48:10 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/26 16:21:12 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global	_ft_read
	section	.text
	extern	___error

_ft_read:
	mov		rax, 0x2000003	; System call for read
	syscall
	jc		error
	ret

error:
	push	rax				; Push rax to the stack
	call	___error		
	mov		rdi, rax		; Move errno address pointer to rdi
	pop		rax				; Retrieve err number
	mov		[rdi], rax		; Move error number into the err address
	mov		rax, -1
	ret
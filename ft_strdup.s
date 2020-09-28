; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/27 12:20:55 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/28 17:26:11 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global	_ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	___error
	section	.text

_ft_strdup:
	cmp		rdi, 0
	je		error
	call	_ft_strlen
	push	rdi			; Re-align stack
	inc		rax			; Space for /0
	mov		rdi, rax	; Moving result of strlen into rdi
	call	_malloc		; Malloc for strlen and rax points to it
	cmp		rax, 0		; Malloc protection lol
	je		error
	pop		rdi			; Returns rdi to str pointer and re-aligns stack
	xor		rdx, rdx 	; Sets index to zero

loop:
	mov		cl, byte[rdi + rdx] ; Copies str to register
	mov		byte[rax + rdx], cl	; Register into pointer to dup address
	cmp		cl, 0				; Check for end of string
	je		return
	inc 	rdx
	jmp		loop
	
error:
	mov		rax, 0
	ret

return:
	ret
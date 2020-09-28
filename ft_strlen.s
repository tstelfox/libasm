; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/18 15:14:51 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/26 14:53:12 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global	_ft_strlen
	section	.text
	
_ft_strlen:
	xor		rax, rax 	; Set rax to zero
	cmp		rdi, 0 		; Checks for null-terminator
	je		finished	; Returns

index:
	cmp		byte[rdi + rax], 0 ; Compares the size byte from the address rdi (I think)
	je		finished	; Returns
	inc		rax			; Incrementing the index
	jmp		index		; Loops while still indexing the string

finished:
	ret

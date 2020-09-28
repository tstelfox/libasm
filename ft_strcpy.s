; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/21 12:52:00 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/28 16:56:58 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global	_ft_strcpy
	section	.text

_ft_strcpy:
	cmp		rsi, 0		; Check if source str exists
	je		exit
	mov		rdx, 0	; Sets rdx(index) to 0

index:
	cmp		byte[rsi + rdx], 0 ; Check if at end of string
	je		return				; If at end, return
	mov		cl, byte[rsi + rdx] ; Save char in register
	mov		byte[rdi + rdx], cl ; Move from register to Dest
	inc		rdx					; Index
	jmp		index

exit:
	mov 	rax, 0		; Return 0
	ret

return:
	mov		byte[rdi + rdx], 0 ; Set terminating char
	mov		rax, rdi 	; Moving pointer to dest into return register
	ret

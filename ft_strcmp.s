; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: tmullan <tmullan@student.codam.nl>           +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/09/22 17:09:59 by tmullan       #+#    #+#                  ;
;    Updated: 2020/09/23 16:12:22 by tmullan       ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

	global _ft_strcmp
	section	.text

_ft_strcmp:
	mov		rdx, 0	; Set index to 0

comparison:
	mov		cl, byte[rsi + rdx] ; Move s2 into register
	mov		al, byte[rdi + rdx]	; Move s1 into register
	cmp		al, 0	; Check for end of s1
	je		ending
	inc		rdx		; Index
	cmp		al, cl	; Compare them
	jl		lower
	jg		higher
	jmp		comparison			; Loop
	
ending:
	cmp		cl, 0	; Check that other is at end as well
	jne		lower
	jmp		return

higher:
	mov		rax, 1		; Make return value positive
	ret

lower:
	mov		rax, -1		; Make return value negative
	ret

return:
	mov		rax, 0 ; Set return value to 0
	ret
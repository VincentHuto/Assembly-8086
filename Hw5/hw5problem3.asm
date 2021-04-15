; multi-segment executable file template.

data segment
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
;locate the cursor at pos 1
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 14h ;col 20   in hex
    int 10h 
    
;A
    mov ah,9    ;Write Char
    mov al,41h  ;A 
    mov bl, 01h ;Blue
    mov cx,1    ;1 Time
    int 10h
     
;locate the cursor at pos 2
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 15h ;col 21   in hex
    int 10h 
    
;B
    mov ah,9    ;Write Char
    mov al,42h  ;B 
    mov bl, 02h ;Green
    mov cx,1    ;1 Time
    int 10h     
     
;locate the cursor at pos 3
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 16h ;col 22   in hex
    int 10h 
;C
    mov ah,9    ;Write Char
    mov al,43h  ;C 
    mov bl, 03h ;Cyan
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 4
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 17h ;col 23   in hex
    int 10h 
;D
    mov ah,9    ;Write Char
    mov al,44h  ;D 
    mov bl, 04h ;Maroon
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 5
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 18h ;col 24   in hex
    int 10h 
;E
    mov ah,9    ;Write Char
    mov al,45h  ;E 
    mov bl, 05h ;Magenta
    mov cx,1    ;1 Time
    int 10h        
  
;locate the cursor at pos 6
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 19h ;col 25   in hex
    int 10h 
;F
    mov ah,9    ;Write Char
    mov al,46h  ;F 
    mov bl, 06h ;Gold
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 7
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Ah ;col 26   in hex
    int 10h 
;G
    mov ah,9    ;Write Char
    mov al,47h  ;G
    mov bl, 07h ;Gray
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 8
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Bh ;col 27   in hex
    int 10h 
;H
    mov ah,9    ;Write Char
    mov al,48h  ;H 
    mov bl, 08h ;Grey
    mov cx,1    ;1 Time
    int 10h        
    
;locate the cursor at pos 9
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Ch ;col 28   in hex
    int 10h 
;I
    mov ah,9    ;Write Char
    mov al,49h  ;I
    mov bl, 0ah ;HiGreen
    mov cx,1    ;1 Time
    int 10h  
;locate the cursor at pos 10
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Dh ;col 29   in hex
    int 10h 
;J
    mov ah,9    ;Write Char
    mov al,4Ah  ;J 
    mov bl, 0bh ;HiCyan
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 11
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Eh ;col 30   in hex
    int 10h 
;K
    mov ah,9    ;Write Char
    mov al,4Bh  ;K 
    mov bl, 0ch ;HiRed
    mov cx,1    ;1 Time
    int 10h        
      
;locate the cursor at pos 12
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 1Fh ;col 31   in hex
    int 10h 
;L
    mov ah,9    ;Write Char
    mov al,4Ch  ;L 
    mov bl, 0dh ;HiMagenta
    mov cx,1    ;1 Time
    int 10h        
      
;locate the cursor at pos 13
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 20h ;col 32   in hex
    int 10h 
;M
    mov ah,9    ;Write Char
    mov al,4Dh  ;M 
    mov bl, 0eh ;HiYellow
    mov cx,1    ;1 Time
    int 10h        
;locate the cursor at pos 14
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 21h ;col 33   in hex
    int 10h 
;N
    mov ah,9    ;Write Char
    mov al,4Eh  ;N 
    mov bl, 0fh ;HiWhite
    mov cx,1    ;1 Time
    int 10h        
     
;locate the cursor at pos 15
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 22h ;col 34   in hex
    int 10h 
;O
    mov ah,9    ;Write Char
    mov al,4Fh  ;O 
    mov bl, 9h  ;HiBlue
    mov cx,1    ;1 Time
    int 10h        
  
     
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    
    sum      db ?     
    srow     db ?            ; upper left row     These will be defined when yu d art 4
    scol     db ?            ; upper left column
    erow     db ?            ; lower right row
    ecol     db ?            ; lower right column
 
    boxes    db  5,10,20,70  ; first box
             db  12,20,18,60  ; second box
             db  1,5,3,10    ; third box
             db  5,60,24,79  ; fourth box
             db  5,25,18,75  ; fifth box
   
    
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
      
    
      
    mov cx, 5 ; loop 5 times     
    lea si,boxes         ;starts the first box at si                              
    L5:                                                       
    push cx  ; save CX on the stack , CX can be used for other tasks 
    ;read and set data for each box and           

    mov al, [si]          ;move 5 into al
    mov srow,al           ;move 5 into srow
    inc si                ;moves to 10
    mov al, [si]          ;etc etc
    mov scol,al    
    inc si
    mov al, [si]
    mov erow,al
    inc si
    mov al, [si]   
    mov ecol,al    
    inc si
    call draw_box  ;Call the procedure/function draw_boc from the bottom   
    
    
    pop cx    ; recover CX from the stack    
    loop L5
   
    
    
    
    ; wait for any key....    
    mov ah, 1
    int 21h
             
             
             
             
    mov ax, 4c00h ; exit to operating system.
    int 21h   
      
                
    draw_box PROC
 ;TOP 
    ;locate the cursor at row 0, col 0
    mov ah, 02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, srow ;row 0   in hex
    mov dl, scol ;col 0   in hex
    int 10h 
    ;Print Corner
    mov ah, 0ah
    mov al, 0DAh 
    mov cx, 1 
    int 10h  
    ;locate the cursor at row 0, col 1
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page       
    mov dh, srow ;row 0   in hex 
        ;Moving cursor over one column
        mov bh,0
        mov al, scol  ;col 0   in hex 
        mov bl, 01h
        add al,bl
        mov sum, al
        mov dl, sum
    int 10h     
    ;Print - 
    mov ah, 0ah
    mov al, 0C4h                
        ;Subtracting ecol-scol   
        mov bx,0
        mov bl, ecol  ;col 70 
        mov cl, scol  ;col 10
        sub bl,cl    
        mov dx,bx     ;bx= 60, dx is where subtractions are sent
        mov cx, dx    ;print the difference times
    int 10h   
    ;locate the cursor at row 0, col 20
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, srow ;row 0  in hex
    mov dl, ecol ;col 20   in hex
    int 10h          
    ;Print Corner
    mov ah, 0ah
    mov al, 0BFh 
    mov cx, 01 
    int 10h  
                   
   ;LEFT WALL
    ;locate the cursor at row 0, col 20      
      ;Subtracting erow-srow   
        mov bx,0
        mov bl, erow  ;col 70 
        mov cl, srow  ;col 10
        sub bl,cl    
        mov dx,bx     ;bx= 60, dx is where subtractions are sent
        mov cx, dx    ;print the difference times
    mov dh, srow ;row 1  in hex
    L1:
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dl, scol ;col 0   in hex 
    inc dh 
    int 10h
    ;Print Wall
    mov ah, 0eh
    mov al, 0B3h  
    int 10h      
    loop L1
   
   
   ;RIGHT WALL
    ;locate the cursor at row 0, col 20 
       ;Subtracting erow-srow   
        mov bx,0
        mov bl, erow  ;col 70 
        mov cl, srow  ;col 10
        sub bl,cl    
        mov dx,bx     ;bx= 60, dx is where subtractions are sent
        mov cx, dx    ;print the difference times 
    mov dh, srow ;row 1  in hex
    L2:
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dl, ecol ;col 20   in hex 
    inc dh 
    int 10h
    ;Print Wall
    mov ah, 0eh
    mov al, 0B3h  
    int 10h      
    loop L2
    
    
   ;BOTTOM    
    ;locate the cursor at row 14, col 0
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, erow ;row 0   in hex
    mov dl, scol ;col 0   in hex
    int 10h   
    ;Print Corner
    mov ah, 0ah
    mov al, 0C0h 
    mov cx, 1 
    int 10h   
    ;locate the cursor at row 14, col 1
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, erow ;row 0   in hex 
        ;Moving cursor over one column
        mov bh,0
        mov al, scol  ;col 0   in hex 
        mov bl, 01h
        add al,bl
        mov sum, al
        mov dl, sum
        int 10h    
    ;Print - 
    mov ah, 0ah
    mov al, 0C4h                
        ;Subtracting ecol-scol   
        mov bx,0
        mov bl, ecol  ;col 70 
        mov cl, scol  ;col 10
        sub bl,cl    
        mov dx,bx     ;bx= 60, dx is where subtractions are sent
        mov cx, dx    ;print the difference times
    int 10h       
    ;locate the cursor at row 14, col 14
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, erow ;row 0   in hex
    mov dl, ecol ;col 0   in hex
    int 10h   
    ;Print Corner
    mov ah, 0ah
    mov al, 0D9h 
    mov cx, 1 
    int 10h   
    ret
    draw_box ENDP
    
     
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
   var1     db  0A1h       ;These 2 are 1 byte but the sum is bigger than 1 so    
   var2     db  0B2h          
   sum      dw  ?          ;Sum has to be 2 bytes or more because it wont fit into db
   
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

; add your code here       
       mov ax, 0    ; initialize ax to zero        
       mov bx, 0    ; initialize ax to zero        
       mov al, var1 ;  move var1 to al        
       mov bl, var2 ; move var 2 to bl        
       add ax, bx   ; add bx to ax (16-bit addition)       
       mov sum, ax  ; move the result to a
    
    ; wait for any key....    
    mov ah, 1
    int 21h
                                                                                                                                                  
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

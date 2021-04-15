; multi-segment executable file template.

data segment
       sum db ?
       adder db -32d
                   
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
      
    
    mov cx,1    
    L1: 
    mov ah,8      ;Read without echo
    int 21h       ;Outputs to Al
    mov ah,2      ;Display Character
    add al, adder ;Converts Lowercase to Uppercase
    mov dl, al    ;Display New Uppercase Letter 
    int 21h    
    
    mov cx,3
    jnz L1
   
             
    mov ax, 4c00h ; exit to operating system.
    int 21h   
    
    
     
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
     string dw 13                        ; length value
     db 'Source string'                  ;Source string is 13 characters long
     dest   db 20 dup(' ')               ;Making 80 spaces open in the memory
        
           
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



                            ;We want to move source string(NOT THE LENGTH) into the 80 memory 
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

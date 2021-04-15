; multi-segment executable file template.

data segment
    ; add your data here!
    array1 db  10h, 20h, 30h
    array2  db  00h, 00h, 00h
   
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
    
    mov cx, 3 ; loop 3 times
    
    move ax, 0 ;initialize ax to 0  
               
               
               
               
     ;Implementing a loop
     L1:       ; label L1
     add ah, 2    
     loop l1

   
 
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

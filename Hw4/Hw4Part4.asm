; multi-segment executable file template.

data segment
    ; add your data here!    
    array dw 15 dup(?)                 ;dw is 2 bytes therefore takes up two blocks in memory   
                                        
   
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
    mov ax,1h
    mov bx,2h     
    mov si,0 
    mov [si],ax
    inc si         
    inc si
    mov [si],bx          
    mov cx,13
   
   L1:                   ;L1 is the name of the loop
    add bx,ax
    mov ax,[si] 
    inc si      
    inc si
    mov [si],bx       
   loop L1         
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

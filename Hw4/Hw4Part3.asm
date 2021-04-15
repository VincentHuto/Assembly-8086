; multi-segment executable file template.

data segment
    ; add your data here!
    array1 db  01h, 02h, 03h,04h, 05h, 06h,07h, 08h, 09h,0ah        ;db is 1 byte dw is 2 bytes
   
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
 mov si, 0
 mov di, 0ah 
 mov cx, 6 
 mov ah, 0ah
 mov al, 0
    
 L1:                    ;L1 is the name of the loop 
 mov al, [si] 
 mov ah, [di]
 mov [si], ah
 mov [di], al
  
 inc si
 dec di
 loop L1             ;Closing loop L1  Each time this is hit CX is decremented by 1
 
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

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

    ; add your code here
  lea  si, array1     ;move the offset of array1 into si
  lea di , array2     ;move the offset of array2 into di
  
  mov  al, [si]       ;di = 0003     Square brackets mean go to that address and see what byte is in in Si and copy that t al
  mov   [di], al
  inc  si
  inc di
  mov  al, [si]
  mov   [di], al
 
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

; multi-segment executable file template.

data segment
    ; add your data here!
    array1 db  10h, 20h, 30h        ;db is 1 byte dw is 2 bytes
    array2  db  00h, 00h, 00h       ;
   
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
  mov cx, 3           ;cx is the loop counter  loop 3 times becasue the array is 3 bytes long
  lea  si, array1     ;"lea" moves the offset of array1 into si(10h)[Adress 0710:0000]
  lea di , array2     ;moves the offset of array2 into di (00)                               
  mov ax,0            ;Initializing ax to 0
    
L1:                   ;L1 is the name of the loop
  mov  al, [si]       ;Square brackets mean go to that address and see what byte is in in Si and copy that to al
                      ;ax= 00 00 di = 0003 
  mov   [di], al
  inc  si
  inc di
  loop L1             ;Closing loop L1  Each time this is hit CX is decremented by 1
 
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

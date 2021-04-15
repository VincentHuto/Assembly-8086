; multi-segment executable file template.

data segment
    ; add your data here!
    array1  db  10h, 20h, 30h, 40h, 50h  ;db is 1 byte
    array2  dw  5 dup(?)                 ;dw is 2 bytes therefore takes up two blocks in memory
                                         ;dup makes it have 5 blank spots in the memory
   
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
  mov cx, 5           ;cx is the loop counter  loop 5 times becasue the array is 5 bytes long,Stored in Cx so it stays out of the way
  lea si, array1     ;"lea" moves the offset of array1 into si(10h)[Adress 0710:0000]
  lea di , array2     ;moves the offset of array2 into di (00)                               
  mov ax,0            ;Initializing ax to 0
    
L1:                   ;L1 is the name of the loop
  mov  al, [si]       ;Square brackets mean go to that address and see what info in in Si and copy that to al               ;ax= 00 00 di = 00 03 
  mov  [di], ax
  inc si              
  inc di    
  inc di                    ;Moves on to the next memory block
  loop L1             ;Closing loop L1  Each time this is hit CX is decremented by 1
                      ; If this is made correctly the memory should read 10 20 30 40 50 10 00 20 00 at [0710:0000]
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

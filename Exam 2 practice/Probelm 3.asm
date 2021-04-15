; multi-segment executable file template.

data segment
   array  dw  -1, 2000, -4000, 32767, 500, -50
   value1 dw  ?
   value2 dw  ?
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
    
    
    mov di, offset array  ;offset array = -1 (mov di, offset array = lea di,array)      
                          ;0710:(0000) = -1 
                          ;     This is di, it is always this adress
    mov ax, [di]          ;ax=-1(ax=2000)(-4000)(32767)
    mov value1, ax        ;value1 = -1(becasue A2 is false = 2000)(32767)
    mov value2, ax        ;value2 = -1(2000)()
    mov cx, 6             ;loop 6 times
    
    
A1:
   mov ax,[di]            ;ax=-1
   cmp ax, value2         ;value2=-1
     jle A2               ;(true)(false)(true)(false)Jump Less than or equal to, is ax<=Value2, if so go to a2,
     
   mov value2, ax
    
     A2:
     cmp ax, value1    
        jge A3               ;(true)(false)(false)Jump Greater than or equal to, is ax=>Value1
     mov value1, ax
    
        A3:                  
        add di, 2            ;move di over 2(incrementing the pointer by 2 because its dw not db)
loop A1    
     mov ax, 4c00h    
     int 21h
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

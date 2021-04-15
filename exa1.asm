; multi-segment executable file template.

data segment
    ; add your data here!
            var1 dw 100Ah  ;At memory address 0710, shows 0A 10 
            var2 dw 200Bh  ;                              0B 20
            sum dw ?
   
   
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax         ;Moves AX int Data segment
    mov es, ax

    ; add your code here
            
    
      mov ax, var1          ;Puts var1 int ax
      add ax, var2          ;Adds var2 into ax
      mov sum, ax           ;Moves whatever is in ax into sum
    
    
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

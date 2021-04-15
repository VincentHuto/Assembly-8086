; multi-segment executable file template.

data segment
    ; add your data here!
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
      mov   al,4Ah           ;al= 01011010(4)(A)      
      mov   cx,8             ;cx=8 
L1:  
      shl   al,1             ;cx=8 CF=0 (10010100) shift all left 1   
                             ;cx=7 CF=1 (00101000) 
                             ;cx=6 CF=0 (01010000) 
                             ;cx=5 CF=0 (1010000) 
                             ;cx=4 CF=1 (01010000) 
                             ;cx=3 CF=0 (10100000) 
                             ;cx=2 CF=1 (01000000) 
                             ;cx=1 CF=0 (10000000) 
                             
      mov   dl,'0'           ;dl = 0 
      jnc   L2               ;Jump Not carry (carry = 0 not carry =1) jump if cf is 1      
      mov   dl,'1'           ;if Cf = 0 displays 1, if Cf = 0 displays 1  
    L2:  
      push  ax               ;save ax to stack      
      mov   ah,2             ;Display character whaever dl is (0)      
      int   21h              ;interupt class
      
      pop   ax               ;retrieve ax      
loop  L1                     ;Loops 8 times
      
      
      mov   ax,4C00h         ;I dont know why this is here tbh its irrelevant
      
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

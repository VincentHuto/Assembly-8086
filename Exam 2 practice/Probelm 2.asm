; mlti-segment executable file template.

data segment
     inner_count  dw   2
     outer_count  dw   3

ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov   ax,@data         
    mov   ds,ax
    mov   cx,outer_count    ;Sets cx to 3
    
    
outer:                                    
    mov   ah,2              ;Place the interupt functin to ah(Funct 2=Display Character in dl)
    mov   dl,'X'
    int   21h               ;Call the interupt class(video display)

    mov   outer_count,cx    ;outercount = 3 
    mov   cx,inner_count    ;cx = 2

 inner:                     ;run inner two times because inner_count = 2
    mov   ah,2           
    mov   dl,'Y'            
    int   21h

 loop  inner                ;dislay Y 2 times by looping inner twice
    
    mov   cx,outer_count    ;recalls that cx is now 2 because Outer Count decremented once 
loop  outer                 ;loop outer(X) 3 times
    
    mov   ax,4C00h        
    int   21h               ;Dislay is XYYXYYXYY

      

    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

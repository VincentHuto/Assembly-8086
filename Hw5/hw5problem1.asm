; multi-segment executable file template.

data segment
    ; add your data here!
    tex db "THIS TEXT IS IN THE WINDOW ", "$"  ;The $ tells it that it is the end of the string  
   
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data    ; put the data segment into ax
    mov ds, ax      ; put ax into dx already
    mov es, ax
      
      
    ;PART 1a  
      
    ;scroll a window from row 5, col 10 to row 20 col 70
    ;with a reverse video attribute
    
    mov ah, 7   ;scroll down          int 7  in the pdf under video
    mov al, 10h ;# of lines           the number of lines in HEX(16 lines)you want to scroll
    mov bh, 70h ;reverse video int    The rgb value in HEX 0(111)0(000)   
                ;                                   S RGB    N RGB-Foregrund
    ;Top left corner of box            
    mov ch, 05h ;upper left row    05 in hex is 5
    mov cl, 0ah ;upper left col    0a in hex is 10
    ;Bottom right corner of box
    mov dh, 14h ;lower right row   20 in hex is 14
    mov dl, 46h ;lower right col   46 in hex is 70
    ;Calling this is the function int10h
    int 10h
    
    
    ;PART 1b
    ;locate the cursor at row 10, col 20
    
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0ah ;row 10   in hex
    mov dl, 14h ;col 20   in hex
    int 10h 
    
    ;PART 1c
    ;display a line of text, such as,"THIS TEXT IS IN THE WINDOW"
    mov ah, 9   ;write string     int 9 in pdf
    lea dx, tex ;The stored string  lea means its a string of bytes
    int 21h

   
    ;PART 1d
    mov ah,00  ;Option for key press
    int 16h    ; User input interupt
    
    ;PART 1e 
    ;scroll a window from row 7, column 12 to row 18, column 68, with a normal attribute(background black foreground white)
    mov ah, 7   ;scroll down          int 7  in the pdf under video
    mov al, 0ch ;# of lines           the number of lines in HEX(12 lines)you want to scroll
    mov bh, 07h ;normal video int    The rgb value in HEX 0(000)0(111)   
    ;Top left corner of box            
    mov ch, 07h ;upper left row    07 in hex is 7
    mov cl, 0ch ;upper left col    0c in hex is 12
    ;Bottom right corner of box
    mov dh, 12h ;lower right row   12 in hex is 18
    mov dl, 44h ;lower right col   46 in hex is 68
    ;Calling this is the function int10h
    int 10h
          
    ;PART 1f    
    ;write a character A with a blinking attribute in the middle of the window locate the cursor at row 9, col 20
    mov ah,02h  ;set cursor pos   interupt number 2 in the pdf under video
    mov bh, 0h  ;video page
    mov dh, 0Dh ;row 13   in hex
    mov dl, 27h ;col 39   in hex
    int 10h
   
   
    ;display A    
    mov cx, 1 
    mov ah,09h  
    mov al,41h  
    mov bl,10000111b ;This is the color in BINARY this should be blinking but EMU8086 doesnt work
    int 10h   
     

    ;PART 1g
    ;wait for a key stroke, and then clear entire screen with a normal attribute   
    mov ah,00  ;Option for key press
    int 16h    ; User input interupt
    
    ;Clear entire screen
    mov ah,6
    mov al,0
    mov bh,7
    mov cx,0
    mov dh,24
    mov dl,79
    int 10H
   
         
    ; wait for any key.... when a key is clicked it ends the program rn   
    mov ah, 1
    int 21h    
       
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

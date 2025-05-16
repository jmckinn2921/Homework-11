
section .data
inputBuf    db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
inputLen    equ $-inputBuf ; should be 8                                                                                                                                                                                                                                      
hexTable    db  '0123456789ABCDEF'


section .bss
outputBuf   resb 80


section .text
global _start


_start:
    mov esi, inputBuf
    mov edi, outputBuf
    mov ecx, inputLen


.nextByte:
    lodsb
    call    byte_to_ascii
    mov    byte [edi], ' '
    inc     edi
    loop    .nextByte


    dec     edi                 ;overwrite the final space with a newline character                                                                                                                                                                                           
    mov     byte [edi], 10


    mov     edx, edi
    sub     edx, outputBuf
    inc     edx
    mov     eax, 4              ;sys_write                                                                                                                                                                                                                                    
    mov     ebx, 1              ;STDOUT                                                                                                                                                                                                                                       
    mov     ecx, outputBuf
    int     0x80


    ; exit                                                                                                                                                                                                                                                                    
    mov     eax, 1              ; Calls a system exit                                                                                                                                                                                                                         
    xor     ebx, ebx
    int     0x80




    byte_to_ascii:
        push    ebx

        mov     bl, al
        shr     bl, 4
        mov     bl, [hexTable + ebx]
        mov     [edi], bl
        inc     edi

        mov     bl, al
        and     bl, 0x0F
        mov     bl, [hexTable + ebx]
        mov     [edi], bl
        inc     edi

        pop     ebx
        ret

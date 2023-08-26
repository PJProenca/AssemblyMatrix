.MODEL FLAT,C

.CODE

PUBLIC MULT_MAT
MULT_MAT PROC     


        push ebp          ;colocar ebp na stack
        mov ebp,esp       ;atribuir o valor do esp ao ebp
        mov eax,[ebp+8]   ;coloca o endereço do primeiro parametro no registo
        mov ebx,[ebp+12]  ;coloca o endereço do segundo parametro no registo
        mov edx,[ebp+16]  ;coloca o endereço do terceiro parametro no registo
        mov ecx,[ebp+20]  ;coloca o endereço do quarto parametro no registo


        repeat_linha:  ;label do primeiro ciclo

            push ecx   ;colocar o registo ecx na stack(contador do ciclo)
            mov ecx,[esp+20]   ;carregar no ecx o quarto parametro       
            push eax            ;colocar o eax na stack
            mov ebx,[ebp+12]    ; carregar no ebx o segundo parametro

            repeat_coluna:   ;label do segundo ciclo
            
                mov eax,[esp] ;colocar no eax os dados para onde o esp aponta
                push ecx       ;colocar o ecx na stack(contador do ciclo)
                push eax              ; colocar o eax na stack  
                push ebx
                mov eax,[ebp+20]     ;colocar no eax o que se encotra no endereço de ebp+20
                mov ecx,4           ;colocar o valor 4 no ecx
                mov edx,0           ;colocar o valor 0 no edx
                div ecx               
                mov ecx,eax                
                mov edi,0
                mov ebx,[esp]
                mov eax,[esp+4]  
                add esp,8
                mov edx,[ebp+16]                
               
               repeat_calc:  

                    movdqu xmm0,[eax]
                    movdqu xmm1,[ebx]
                    pmulld xmm1,xmm0                               
                    pshufd xmm2,xmm1,1110b      
                    paddd xmm2,xmm1
                    pshufd xmm1,xmm2,01b
                    paddd xmm2,xmm1
                    push eax
                    pextrd eax,xmm3,00b
                    add edi,eax
                    mov eax,[esp]  
                    add eax,16 
                    add ebx,16 
                    add esp,4 
                    dec ecx 

                jnz repeat_calc  
          
                mov ecx,[esp]   
                add esp,4                
                mov [edx],edi
                add edx,4
                dec ecx

            jnz repeat_coluna  
            
            mov ecx,[esp+4]
            add esp,8
            mov ebx,[ebp+12]
            dec ecx

        jnz repeat_linha 

        pop ebp    
        
	RET
MULT_MAT ENDP

END
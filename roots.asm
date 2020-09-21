; roots.asm
segment .text
global  _roots

_roots:
        enter   0,0
        xor     EAX,EAX
        fld     qword[EBP+8]          
        fadd    ST0                    
        fld     qword[EBP+8]        
        fld     qword[EBP+24]      
        fmulp   ST1                   
        fadd    ST0                 
        fadd    st0                   
        fchs                         
        fld     qword[EBP+16]          
        fld     qword[EBP+16]         
        fmulp   ST1                 
        faddp   ST1                    
        ftst                          
        fstsw   AX                      
        sahf                           
        jb      no_real_roots           
        fsqrt                        
        fld     qword[EBP+16]        
        fchs                           
        fadd    ST1                  
        fdiv    ST2                    
        mov     EAX,dword[EBP+32]      
        fstp    qword[EAX]          
        fchs                           
        fld     qword[EBP+16]           
        fchs                            
        faddp   ST1                   
        fdivrp  ST1                   
        mov     EAX,dword[EBP+36]      
        fstp    qword[EAX]             
        mov     EAX,1                  
        jmp     short done
no_real_roots:
        fchs                         
        fsqrt                           
        fld     qword[EBP+16]          
        fchs                          
        fadd    ST1                     
        fdiv    ST2                     
        mov     EAX,dword[EBP+32]     
        fstp    qword[EAX]        
        fchs                            
        fld     qword[EBP+16]          
        fchs                          
        faddp   ST1                   
        fdivrp  ST1                     
        mov     EAX,dword[EBP+36]  
        fstp    qword[EAX]             
        sub     EAX,EAX                 
done:
        leave
        ret


;Ghulam Mohyuddin
;23-NTU-CS-FL-1158
;BS-SE3A
;Home Task Lab 10
;Task 1 (Sum of positive numbers)
include irvine32.inc
.data
array sword 10,12,14,16,18,-11,-13,-15,-17,-19             ;Array of numbers
sumMsg byte "Sum of positive Numbers is: ",0               ;Message to display the sum
CountMsg byte "Total number of positive numbers are: ",0   ;Message to display the Total number

.code
main proc
call clrscr                                                ;Clear the screen so we start fresh

mov esi, offset array
mov ecx, lengthof array                                    ;Seting counter to the number of items in the array
mov eax, 0                                                 ;Removing garbage value from EAX
mov ebx, 0                                                 ;Removing garbage value from EBX

NEXT:                                                      ;Label named NEXT
    mov dx, word ptr [esi]                                 ;Get the current number from the array
    test dx, 8000h                                         ;Checking/testing if the number is negative
    jnz negative                                           ;Skip the number if it is negative
    add ax, dx                                             ;Adding the positive number to the sum
    inc ebx                                                ;Incrementing the EBX for going to next index
Negative:                                                  ;Label named Negative
    add esi, type array                                    ;Moving to the next number in the array
    loop NEXT

mov edx, offset sumMsg                                     ;Passing address of sumMsg to EDX
call writestring
call writedec
call crlf
mov edx, offset CountMsg                                   ;Passing address of CountMsg to EDX
call writestring
mov eax, ebx
call writedec
exit
main endp
end main
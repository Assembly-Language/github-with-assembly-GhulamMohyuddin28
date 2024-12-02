;Ghulam Mohyuddin
;23-NTU-CS-FL-1158
;BS-SE3A
;Home Task Lab 10
;Task 3 (Sum of even numbers)
include irvine32.inc
.data
array sword 1,3,5,7,9,2,4,6,8,10                          ;Array of numbers
sumMsg byte "Sum of Even Numbers is: ",0                  ;Message to display the sum
CountMsg byte "Total number of Even numbers are: ",0      ;Message to display the total number

.code
main proc
call clrscr

mov esi, offset array                                     ;Passing address of array to ESI
mov ecx, lengthof array                                   ;Setting counter to the number of items in the array
mov eax, 0                                                ;Removing garbage value from EAX
mov ebx, 0                                                ;Removing garbage value from EBX

Next:                                                     ;Label named Next
    mov dx, word ptr [esi]                                ;Get the current number from the array
    test dx, 0001h                                        ;Checking/testing if the number is odd
    jnz skip                                              ;Skip if the number is odd

    add ax, dx                                            ;Adding the even number to the sum
    inc ebx                                               ;Incrementing EBX to count the even number

Skip:                                                     ;Label named Skip
    add esi, type array                                   ;Moving to the next number in the array
    loop Next

mov edx, offset sumMsg                                    ;Passing address of sumMsg to EDX
call writestring
call writedec
call crlf

mov edx, offset CountMsg                                  ;Passing address of CountMsg to EDX
call writestring
mov eax, ebx                                              ;Moving the count of even numbers into EAX
call writedec

exit
main endp
end main
;由于引导程序开始地方是 0x7c00
;保证程序正确性，后续的偏移位置都加上 0x7c00
org 0x7c00

mov ax, message ;message 标签位置 复制到 ax 寄存器中
mov bp, ax      
mov ah, 13h     ;写字符串
mov al, 1h      ;写模式
mov bx, 0x9     ;字符颜色
mov cx, 0xb     ;字符长度
mov dx, 0x0202  ;行 列
int 10h         ;调用biso的函数

message:
	db "Hello World!"

;后续填充0
times 510-($-$$) db 0

;最终两个字节必须是 AA55
dw 0xAA55
nasm -f elf main.asm
ld -m elf_i386 main.o -o main
./main
mv main.o bin
mv main bin



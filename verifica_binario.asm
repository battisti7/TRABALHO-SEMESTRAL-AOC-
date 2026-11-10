.data
pedido: .asciiz "Digite um numero inteiro maior que zero: "
erro: .asciiz "O numero deve ser maior que zero. Tente novamente.\n"
sim: .asciiz "O numero é binario.\n"
nao: .asciiz "O numero nao é binario.\n"

.text
main:
ler:
    li $v0, 4
    la $a0, pedido
    syscall

    li $v0, 5
    syscall
    add $t0, $v0, $zero

    ble $t0, $zero, invalido

    li $t1, 10
    li $t3, 1

verificar:
    beq $t0, $zero, binario
    rem $t2, $t0, $t1
    bgt $t2, $t3, nao_binario
    div $t0, $t0, $t1
    j verificar

invalido:
    li $v0, 4
    la $a0, erro
    syscall
    j ler

binario:
    li $v0, 4
    la $a0, sim
    syscall
    j fim

nao_binario:
    li $v0, 4
    la $a0, nao
    syscall

fim:
    li $v0, 10
    syscall

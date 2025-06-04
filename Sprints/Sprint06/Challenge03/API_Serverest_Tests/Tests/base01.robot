*** Settings ***
Resource    ../Resources/fluxo01.robot
Resource    ../Resources/fluxo02.robot

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev

*** Test Cases ***
# 1. Fluxo Essencial de Cadastro e Validação de Usuário
Cenário 01: Criar um usuário válido
    Criar uma sessão no Serverest 01
    Cadastrar um usuário com as informações necessárias
    Validar a resposta 01
    Armazenar o ID do novo usuário

Cenário 02: Tentar criar um usuário com os dados do usuário do C01
    Criar uma sessão no Serverest 02
    Cadastrar um usuário com as mesmas informações do usuário anterior
    Validar resposta 02

Cenário 03: Tentar criar um usuário com senha inválida
    Criar uma sessão no Serverest 03
    Cadastrar um usuário com uma senha de 4 caracteres
    Validar resposta 03 
    Cadastrar um usuário com uma senha de 11 caracteres
    Validar resposta 04

Cenário 04: Deletar usuário com ID inexistente
    Criar uma sessão no Serverest 04
    Enviar um ID inexistente de um suposto usuário para Deletar
    Validar resposta 05

# 2. Fluxo Essencial de Login e Validação de Sessão
Cenário 05: Login com email e senha corretos, obter o token
    Criar uma sessão no Serverest 05
    Fazer login com os dados do usuário criado no C01
    Validar resposta 06
    Armazenar o token em uma variável global

Cenário 06: Login com email inexistente
    Criar uma sessão no Serverest 06
    Tentar fazer login com um email qualquer
    Validar resposta 07

Cenário 07: Login com senha incorreta
    Criar uma sessão no Serverest 07
    Tentar fazer login com uma senha qualquer
    Validar resposta 08


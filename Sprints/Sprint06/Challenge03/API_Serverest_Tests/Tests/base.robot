*** Settings ***
Resource    ../Resouces/fluxo01.robot

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev

*** Test Cases ***
Cenário 01: Criar um usuário válido
    Criar uma sessão no Serverest 
    Cadastrar um usuário com as informações necessárias
    Validar a resposta com Status 201
    Armazenar o ID do novo usuário

Cenário 02: Tentar criar um usuário com os dados do usuário do C01
    Criar uma sessão no Serverest
    Cadastrar um usuário com as mesmas informações do usuário anterior
    Validar resposta negativa

Cenário 03: Tentar criar um usuário com senha inválida
    Criar uma sessão no Serverest
    Cadastrar um usuário com uma senha de 4 caracteres
    Validar response 
    Cadastrar um usuário com uma senha de 11 caracteres
    Validar resposta negativa

Cenário 04: Tentar atualizar um usuário com ID inexistente
    Criar uma sessão no Serverest
    Enviar os dados de um usuário com um ID inexistente e solicitar atualização
    Validar a resposta
    Armazenar o ID do novo usuário cadastrado
    Buscar usuário com o ID informado
    Validar resposta obtida

Cenário 05: Deletar usuário com ID inexistente
    Criar uma sessão no Serverest
    Enviar um ID inexistente de um suposto usuário para Deletar
    Validar resposta negativa


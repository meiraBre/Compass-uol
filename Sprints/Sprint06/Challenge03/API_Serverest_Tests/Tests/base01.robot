*** Settings ***
Resource    ../Resources/fluxo01.robot
Resource    ../Resources/fluxo02.robot
Resource    ../Resources/fluxo03.robot
Resource    ../Resources/fluxo04.robot

Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

*** Variables ***
${URL_Serverest}    https://compassuol.serverest.dev
&{HEADERS}          Content-Type=application/json
${ADMINISTRADOR}    true


*** Test Cases ***  
# 1. Fluxo Essencial de Cadastro e Validação de Usuário
Cenário 01: Criar um usuário válido
    Criar uma sessão no Serverest 01
    Gerar dados do usuário
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

# 3. Fluxo Essencial de Cadastro e Manipulação de Produto
Cenário 08: Cadastrar produto com nome único
    Criar uma sessão no Serverest 08, com o token
    Cadastrar as informações do novo produto
    Validar resposta 09

Cenário 09: Cadastrar produto com nome já usado
    Criar uma sessão no Serverest 09
    Colocar as informações do mesmo produto cadastrado anteriormente
    Validar a resposta 10

Cenário 10: Atualizar produto com nome já existente
    Criar uma sessão no Serverest 10
    Tentar atualizar um produto com o nome do produto criado no C08
    Validar resposta 11

Cenário 11: Tentar realizar ação em produto sem autenticação
    Criar uma sessão no Serverest 11
    Tentar cadastrar um produto sem autenticação
    Validar resposta 12


# 4. Fluxo Essencial de Carrinho - Restrições e Manipulação
Cenário 12: Criar um carrinho com produtos
    Criar uma sessão no Serverest 12
    Fazer um login do usuário
    Armazenar e utilizar o token no header
    Criar um produto e armazenar o ID
    Criar um carrinho com os produtos
    Validar resposta 13

Cenário 13: Tentar criar um segundo carrinho para o mesmo usuário
    Criar uma sessão no Serverest 13
    Fazer um login do usuário do cadastro anterior
    Armazenar e utilizar o token no header dele novamente
    Tentar criar mais um carinho para esse usuário
    Validar resposta 14

Cenário 14: Excluir carrinho com produtos e verificar se os produtos retornam ao estoque
    Criar uma sessão no Serverest 14
    Fazer um login com o usuário do carrinho cadastrado
    Armazenar e utilizar o token no header para a ação
    Excluir o carrinho
    Validar resposta 15

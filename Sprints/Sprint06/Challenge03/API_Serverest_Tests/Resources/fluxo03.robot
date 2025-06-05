*** Settings ***
Resource    ../Tests/base01.robot

*** Variables ***

*** Keywords ***
# Avalia o fluxo para cadastrar um produto com nome único
Criar uma sessão no Serverest 08, com o token
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER}    
Cadastrar as informações do novo produto
    ${Nome_Produto}=    FakerLibrary.Word
    Set Global Variable    ${Nome_Produto}
    ${BODY}=    Create Dictionary    
    ...    nome=${Nome_Produto}
    ...    preco= 470
    ...    descricao= Mouse
    ...    quantidade= 381
    ${CADASTRO}=    Post On Session    Serverest    /produtos    json=${BODY}    
    Set Test Variable    ${CADASTRO}
Validar resposta 09
    Should Be Equal As Integers    ${CADASTRO.status_code}    201

# Tentar Cadastrar produto com nome já usado anteriormente
Criar uma sessão no Serverest 09
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER}  
Colocar as informações do mesmo produto cadastrado anteriormente
    ${BODY}=    Create Dictionary    
    ...    nome=${Nome_Produto}
    ...    preco= 470
    ...    descricao= Mouse
    ...    quantidade= 381
    ${CADASTRO}=    Post On Session    Serverest    /produtos    json=${BODY}    expected_status=anything
    Set Test Variable    ${CADASTRO}
Validar a resposta 10
    Should Be Equal As Integers    ${CADASTRO.status_code}    400

# Teste para validar o comportamento do sistema ao tentar atualizar o produto com um nome já existente
Criar uma sessão no Serverest 10
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER} 
Tentar atualizar um produto com o nome do produto criado no C08
    ${BODY}=    Create Dictionary
    ...    nome=${Nome_Produto}
    ...    preco= 470
    ...    descricao= Mouse
    ...    quantidade=381
    ${Atualizacao}=    Put On Session    Serverest    /produtos/jogfODIlXsqxNFS2    json=${BODY}    expected_status=anything
    Set Test Variable    ${Atualizacao}
Validar resposta 11
    Should Be Equal As Integers    ${Atualizacao.status_code}    400

# Teste para avaliar uma ação em um produto sem autenticação
Criar uma sessão no Serverest 11
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADERS}
Tentar cadastrar um produto sem autenticação
    ${BODY}=    Create Dictionary    
    ...    nome=Microfone
    ...    preco= 470
    ...    descricao= Microfone
    ...    quantidade= 381
    ${CADASTRO}=    Post On Session    Serverest    /produtos    json=${BODY}    expected_status=anything    
    Set Test Variable    ${CADASTRO}
Validar resposta 12
    Should Be Equal As Integers    ${CADASTRO.status_code}    401
    ${mensagem}=    Get From Dictionary    ${CADASTRO.json()}    message
    Should Contain    ${mensagem}    Token de acesso ausente, inválido, expirado ou usuário do token não existe mais
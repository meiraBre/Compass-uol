*** Settings ***
Resource    ../Tests/base01.robot

*** Variables ***

*** Keywords ***
#Avalia a criação de um carrinho com produtos
Criar uma sessão no Serverest 12
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER} 
Fazer um login do usuário
    ${BODY}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    ${LOGIN}=    Post on Session    Serverest    /login    json=${BODY}  
    Set Test Variable    ${LOGIN} 
Armazenar e utilizar o token no header
    ${TOKEN}=    Get From Dictionary    ${LOGIN.json()}    authorization
    Set Global Variable    ${TOKEN}
    Log To Console    ${TOKEN}
Criar um produto e armazenar o ID
    ${Nome_Produto_Novo}=    FakerLibrary.Word
    ${BODY}=    Create Dictionary    
    ...    nome=${Nome_Produto_Novo}
    ...    preco= 470
    ...    descricao= Mouse
    ...    quantidade= 381
    ${CADASTRO}=    Post On Session    Serverest    /produtos    json=${BODY}    
    Set Test Variable    ${CADASTRO}
    ${ID_PRODUTO}=    Get From Dictionary    ${CADASTRO.json()}    _id
    Set Global Variable    ${ID_PRODUTO}
    Log To Console    ${ID_PRODUTO}
Criar um carrinho com os produtos
    ${ITEM}=    Create Dictionary    idProduto=${ID_PRODUTO}    quantidade=1
    ${LISTA_PRODUTOS}=    Create List    ${ITEM}
    ${PRODUTOS}=    Create Dictionary    produtos=${LISTA_PRODUTOS}

    ${CRIAR_CARRINHO}=    Post On Session    Serverest    /carrinhos    json=${PRODUTOS}
    Set Test Variable    ${CRIAR_CARRINHO}
Validar resposta 13
    Should Be Equal As Integers    ${CRIAR_CARRINHO.status_code}    201
    Log To Console    ${CRIAR_CARRINHO.json()}

# Tentar criar um segundo carrinho para o mesmo usuário
Criar uma sessão no Serverest 13
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER} 
Fazer um login do usuário do cadastro anterior
    ${BODY}=    Create Dictionary
    ...    email=fulano@qa.com
    ...    password=teste
    ${LOGIN}=    Post on Session    Serverest    /login    json=${BODY}  
    Set Test Variable    ${LOGIN} 
Armazenar e utilizar o token no header dele novamente
    ${TOKEN}=    Get From Dictionary    ${LOGIN.json()}    authorization
    Set Global Variable    ${TOKEN}
    Log To Console    ${TOKEN}
Tentar criar mais um carinho para esse usuário
    ${ITEM}=    Create Dictionary    idProduto=${ID_PRODUTO}    quantidade=1
    ${LISTA_PRODUTOS}=    Create List    ${ITEM}
    ${PRODUTOS}=    Create Dictionary    produtos=${LISTA_PRODUTOS}

    ${CRIAR_CARRINHO}=    Post On Session    Serverest    /carrinhos    json=${PRODUTOS}    expected_status=anything    
    Set Test Variable    ${CRIAR_CARRINHO}
Validar resposta 14
    Log To Console    ${CRIAR_CARRINHO.json()}

# Avalia o fluxo de excluir carrinho com produtos e verificar se os produtos retornam ao estoque
Criar uma sessão no Serverest 14
    ${HEADER}=    Create Dictionary    Content-Type=application/json    Authorization=${TOKEN}
    Create Session    Serverest    ${URL_Serverest}    headers=${HEADER} 
Fazer um login com o usuário do carrinho cadastrado
    ${BODY}=    Create Dictionary
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ${LOGIN}=    Post on Session    Serverest    /login    json=${BODY}  
    Set Test Variable    ${LOGIN} 
Armazenar e utilizar o token no header para a ação
    ${TOKEN}=    Get From Dictionary    ${LOGIN.json()}    authorization
    Set Global Variable    ${TOKEN}
    Log To Console    ${TOKEN}
Excluir o carrinho
    ${EXCLUIR_CARRINHO}=    Delete On Session    Serverest    /carrinhos/cancelar-compra     
    Set Test Variable    ${EXCLUIR_CARRINHO}
Validar resposta 15
    Should Be Equal As Integers    ${EXCLUIR_CARRINHO.status_code}    200
    ${mensagem}=    Get From Dictionary    ${EXCLUIR_CARRINHO.json()}    message
    Should Contain    ${mensagem}    Registro excluído com sucesso
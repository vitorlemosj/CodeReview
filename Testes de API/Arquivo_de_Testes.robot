*** Settings ***
Library    RequestsLibrary

*** Variables ***
${URL_BASE}    https://reqres.in/api
${URL_BASE_BIBLIOTECA}  https://minha-biblioteca.com/api

*** Test Cases ***

#Usuario
Listar Usuários
    [Documentation]   
    Create Session    api    ${URL_BASE}
    ${resposta}=    GET On Session    api    /users?page=2
    Should Be Equal As Integers    ${resposta.status_code}    200
    Log To Console    >>> Lista de usuários: ${resposta.json()}

Criar Usuário
    [Documentation]   
    Create Session    api    ${URL_BASE}
    ${corpo}=    Create Dictionary    nome=Carlos    trabalho=Tester
    ${resposta}=    POST On Session    api    /users    json=${corpo}
    Should Be Equal As Integers    ${resposta.status_code}    201
    Log To Console    >>> Usuário criado: ${resposta.json()}

Atualizar Usuário
    [Documentation]    
    Create Session    api    ${URL_BASE}
    ${corpo}=    Create On Dictionary    nome=Eduardo    trabalho=QA
    ${resposta}=    PUT Session    api    /users/2    json=${corpo}
    Should Be Equal As Integers    ${resposta.status_code}    200
    Log To Console    >>> Usuário atualizado: ${resposta.json()}

Deletar Usuário
    [Documentation]  
    Create Session    api    ${URL_BASE}
    ${resposta}=    DELETE On Session    api    /users/2
    Should Be Equal As Integers    ${resposta.status_code}    204
    Log To Console    >>> Usuário deletado com sucesso!

#Biblioteca

Listar Livros
    [Documentation]    
    Create Session    api_livros    ${URL_BASE_BIBLIOTECA}
    ${resposta}=    GET On Session    api_livros    /livros
    Should Be Equal As Integers    ${resposta.status_code}    200
    Log To Console    >>> Lista de livros: ${resposta.json()}


Cadastrar Livro
    [Documentation]    
    Create Session    api_livros    ${URL_BASE_BIBLIOTECA}
    ${corpo}=    Create Dictionary    titulo=Dom Casmurro    autor=Machado de Assis    ano=1899
    ${resposta}=    POST On Session    api_livros    /livros    json=${corpo}
    Should Be Equal As Integers    ${resposta.status_code}    201
    Log To Console    >>> Livro cadastrado: ${resposta.json()}

Atualizar Livro
    [Documentation]   
    Create Session    api_livros    ${URL_BASE_BIBLIOTECA}
    ${corpo}=    Create Dictionary    titulo=Dom Casmurro (Edição Revisada)    autor=Machado de Assis    ano=1900
    ${resposta}=    PUT On Session    api_livros    /livros/1    json=${corpo}
    Should Be Equal As Integers    ${resposta.status_code}    200
    Log To Console    >>> Livro atualizado: ${resposta.json()}

Deletar Livro
    [Documentation]    
    Create Session    api_livros    ${URL_BASE_BIBLIOTECA}
    ${resposta}=    DELETE On Session    api_livros    /livros/1
    Should Be Equal As Integers    ${resposta.status_code}    204
    Log To Console    >>> Livro deletado com sucesso!
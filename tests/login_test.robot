*** Settings ***
Documentation    Suíte de testes de login — fluxo crítico do e-commerce.
...              Cobre: login válido, login inválido e campos obrigatórios.
...              Tags: smoke (caminho feliz), regression (caminhos alternativos).
Resource         ../resources/hooks.robot
Resource         ../resources/pages/login_page.robot
Test Setup       Abrir navegador na home
Test Teardown    Fechar navegador

Force Tags       login

*** Test Cases ***
CT001 - Login com credenciais válidas
    [Documentation]    Usuário padrão consegue acessar a home de produtos.
    [Tags]    smoke    positivo
    Fazer login    ${usuario_padrao}    ${senha_padrao}
    Pagina de produtos deve carregar

CT002 - Login com senha inválida
    [Documentation]    Sistema bloqueia acesso e exibe mensagem de erro.
    [Tags]    regression    negativo
    Fazer login    ${usuario_padrao}    senha_errada
    Login deve falhar com mensagem    Epic sadface: Username and password do not match any user in this service

CT003 - Login sem preencher campos obrigatórios
    [Documentation]    Valida mensagem de erro quando campos ficam vazios.
    [Tags]    regression    negativo
    Fazer login    ${EMPTY}    ${EMPTY}
    Login deve falhar com mensagem    Epic sadface: Username is required

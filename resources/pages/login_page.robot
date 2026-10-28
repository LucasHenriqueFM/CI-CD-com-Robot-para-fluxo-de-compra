*** Settings ***
Documentation    Page Object da tela de login (exemplo: saucedemo.com).
...              Centraliza locators e keywords específicas de login.
Resource         base_page.robot

*** Variables ***
# --- Locators ---
${CAMPO_USUARIO}       id:user-name
${CAMPO_SENHA}         id:password
${BOTAO_ENTRAR}        id:login-button
${MENSAGEM_ERRO}       css:h3[data-test="error"]

*** Keywords ***
Fazer login
    [Arguments]    ${usuario}    ${senha}
    [Documentation]    Preenche credenciais e submete o formulário de login.
    Wait Until Element Is Visible    ${CAMPO_USUARIO}
    Input Text      ${CAMPO_USUARIO}    ${usuario}
    Input Password  ${CAMPO_SENHA}      ${senha}
    Click Button    ${BOTAO_ENTRAR}

Login deve falhar com mensagem
    [Arguments]    ${mensagem_esperada}
    [Documentation]    Valida que a tela exibiu o erro esperado.
    Wait Until Element Is Visible    ${MENSAGEM_ERRO}
    Element Text Should Be    ${MENSAGEM_ERRO}    ${mensagem_esperada}

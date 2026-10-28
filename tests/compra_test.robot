*** Settings ***
Documentation    Suíte de testes do fluxo de compra (carrinho → checkout).
...              Tags: smoke (fluxo principal), regression (cenários de borda).
Resource         ../resources/hooks.robot
Resource         ../resources/pages/produtos_page.robot
Test Setup       Abrir navegador na home
Test Teardown    Fechar navegador

Force Tags       compra

*** Test Cases ***
CT001 - Adicionar produto ao carrinho
    [Documentation]    Usuário logado adiciona um produto e o carrinho reflete.
    [Tags]    smoke    positivo
    Fazer login    ${usuario_padrao}    ${senha_padrao}
    Pagina de produtos deve carregar
    Adicionar produto ao carrinho    Sauce Labs Backpack
    # TODO: validar ícone do carrinho com contador "1"

CT002 - Fluxo completo de compra
    [Documentation]    Login → adicionar ao carrinho → checkout → confirmação.
    [Tags]    smoke    e2e
    Log    TODO: implementar página de carrinho e checkout    WARN

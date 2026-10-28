*** Settings ***
Documentation    Page Object da home/produtos (exemplo: saucedemo.com).
Resource         base_page.robot

*** Variables ***
# --- Locators ---
${TITULO_PRODUTOS}     css:span[data-test="title"]
${ITEM_INVENTARIO}     css:div[data-test="inventory-item"]
${BOTAO_ADD_CARRINHO}  css:button[data-test^="add-to-cart"]
${ICONE_CARRINHO}      css:a[data-test="shopping-cart-link"]

*** Keywords ***
Pagina de produtos deve carregar
    [Documentation]    Valida que o usuário está logado e na listagem de produtos.
    Wait Until Element Is Visible    ${TITULO_PRODUTOS}
    Element Text Should Be    ${TITULO_PRODUTOS}    Products

Adicionar produto ao carrinho
    [Arguments]    ${nome_produto}
    [Documentation]    Localiza o card do produto pelo nome e clica em "Add to cart".
    ${locator_produto}=    Catenate    SEPARATOR=    css:div[data-test="inventory-item"] [data-test="item-"]
    # Implementar conforme estrutura real do site-alvo
    Log    TODO: implementar clique no produto "${nome_produto}"    WARN

*** Settings ***
Documentation    Page Object base — keywords compartilhadas por todas as páginas.
...              Toda página (login_page, produtos_page, etc.) deve importar
...              este arquivo e delegar a ele as ações genéricas de browser.
Library          SeleniumLibrary    timeout=30s    implicit_wait=10s    run_on_failure=Capture Page Screenshot
Variables        ../variables/common_variables.yaml
Variables        ../variables/environments/${environment}.yaml
Library          String

*** Variables ***
${URL}           ${base_url}
${TIMEOUT}       ${timeout}

*** Keywords ***
Abrir navegador na home
    [Documentation]    Abre o browser configurado e acessa a base_url do ambiente.
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Fechar navegador
    [Documentation]    Encerra a sessão do browser com segurança.
    Close All Browsers

Scroll até o elemento
    [Arguments]    ${locator}
    [Documentation]    Rola a página até o elemento ficar visível.
    Scroll Element Into View    ${locator}

Elemento deve estar visível
    [Arguments]    ${locator}
    [Documentation]    Assertion genérica de visibilidade com timeout padrão.
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Element Should Be Visible    ${locator}

Capturar evidência
    [Arguments]    ${nome_evidencia}
    [Documentation]    Salva screenshot nomeado em results/ para evidência de teste.
    Capture Page Screenshot    ${OUTPUT_DIR}${/}${nome_evidencia}.png

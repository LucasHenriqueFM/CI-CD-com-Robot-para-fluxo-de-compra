*** Settings ***
Documentation    Hooks globais da automação.
...              Importe este arquivo nas suítes de teste — ele traz as
...              variáveis do ambiente e o Page Object base.
...              O ambiente é escolhido via CLI:  robot --variable environment:staging

Resource         ../pages/base_page.robot
Variables        variables/common_variables.yaml
Variables        variables/environments/${environment}.yaml

*Settings*
Documentation       nBank custom actions


*Keywords*

Check The Balance
    [Arguments]     ${usuario}      ${balance_amount}

    Wait For Elements State     css=.navbar-item >> text= Olá ${usuario}, seu saldo é R$ ${balance_amount}
    ...                         visible  5

Go To Pix Page  

    Click       text=Fazer Pix

    Wait For Elements State        css=.modal-card-title >> text=PIX
    ...                             visible     5

Fill Pix Form
    [Arguments]     ${pix_information} 
    
    Select Options By           css=.field select                 text      ${pix_information}[bank]
    Fill Text                   css=input[placeholder='Chave PIX']          ${pix_information}[key_pix]
    Fill Text                   css=input[placeholder='Valor']              ${pix_information}[value] 

Send Pix
    Click                   css=button >> text= Enviar PIX

Transaction Must Be On The Statement
    [Arguments]         ${pix_information} 
    ${element}          Set Variable        xpath=//td[contains(text(),'${pix_information}[bank]')]/..  

    Wait For Elements State     ${element}          visible     5
    Get Text                    ${element}          contains    ${pix_information}[bank]
    Get Text                    ${element}          contains    ${pix_information}[value]
    Get Text                    ${element}          contains    ${pix_information}[key_pix]


Error Message Should Be
    [Arguments]     ${expected_message}
    Wait For Elements State     css=.message >> text=${expected_message}
    ...                         visible     5
*Settings*

Documentation       Validation Pix with positive, negative and zero value

Resource            ${EXECDIR}/resources/base.robot
Library             ${EXECDIR}/resources/factories/pixInformation.py

Test Setup          Start Session
Test Teardown       End Session


*Test Cases*

### Cenario 2: Fazer PIX
# Dado que meu saldo é de R$ 1000 = OK
# E acesso a home nBank= OK
# Quando faço um PIX no valor de R$ 100 =OK
# Então meu saldo final deve ser de R$ 900 = OK 
# E a transação em questão é adicionada no meu Extrato

Do pix with positive value
    [Tags]      doing

    ${pix_information}          Factory Pix Positive Value 
    Go To Pix Page
    Fill Pix Form               ${pix_information} 
    Send Pix
    Check The Balance           Papito          900
    Transaction Must Be On The Statement    ${pix_information} 


### Cenario 3: PIX com valor ZERO
# Dado que meu saldo é de R$ 1000
# E acesso a home nBank
# Quando faço um PIX no valor de R$ 0
# Então vejo a mensgem de alerta "Oops. Transferir ZERO é osso hein..."

Do pix with zero value 

    [Tags]      doing

    ${pix_information}          Factory Pix Zero Value 

    Go To Pix Page
    Fill Pix Form               ${pix_information} 
    Send Pix
    Error Message Should Be     Oops. Transferir ZERO é osso hein...

Do pix with negative value

    [Tags]      doing
    &{pix_information}          Factory Pix Negative Value

    Go To Pix Page
    Fill Pix Form               ${pix_information}      
    Send Pix
    Error Message Should Be     Oops. Valor para PIX incorreto...





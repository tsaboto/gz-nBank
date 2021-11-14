*Settings*

Documentation       Validation Pix with positive, negative and zero value

Resource            ${EXECDIR}/resources/base.robot
Library             ${EXECDIR}/resources/factories/pixInformation.py

Test Setup          Start Session
Test Teardown       End Session


*Test Cases*

Send a Pix with positive value
    [Tags]      doing

    ${pix_information}          Factory Pix Positive Value 
    Go To Pix Page
    Fill Pix Form               ${pix_information} 
    Send Pix
    Check The Balance           Papito          900
    Transaction Must Be On The Statement    ${pix_information} 

Send a Pix with zero value 

    [Tags]      doing

    ${pix_information}          Factory Pix Zero Value 

    Go To Pix Page
    Fill Pix Form               ${pix_information} 
    Send Pix
    Error Message Should Be     Oops. Transferir ZERO é osso hein...

Send a Pix with negative value

    [Tags]      doing
    &{pix_information}          Factory Pix Negative Value

    Go To Pix Page
    Fill Pix Form               ${pix_information}      
    Send Pix
    Error Message Should Be     Oops. Valor para PIX incorreto...





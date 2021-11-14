*Settings*
Documentation       Test suite to check if the app is online

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       End Session


*Test Cases*
Check the latest balance
    Get Title           equal       nBank by QAninja

    Check The Balance       Papito          1000

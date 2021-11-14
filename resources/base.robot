*Settings*

Documentation       It's not a test, is the main class

Library             Browser
Library             String

Resource        actions.robot

*Variables* 
${BASE_URL}         https://nbank.vercel.app      


*Keywords*
Start Session

    New Browser     chromium    headless=False      slowMo=00:00:01
    New Page        ${BASE_URL}

End Session

    Take Screenshot
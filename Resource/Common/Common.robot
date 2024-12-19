*** Settings ***
Library      SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Variables ***


*** Keywords ***
Begin Web Test
    open browser  about:blank  ${BROWSER}
    # maximize browser window

End Web Test
   Close All Browsers
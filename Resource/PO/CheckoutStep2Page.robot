*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Keywords ***

verify overview page load
    # Click Button    id=continue
    Wait Until Page Contains    Checkout: Overview
finish
    Click Button    id=finish
    Page Should Contain    Thank you for your order!
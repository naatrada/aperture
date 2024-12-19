*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Keywords ***
Go to Overview page
    click Element    ${SHOPPING_CART}
    page should contain    ${OVERVIEW_PAGE_TEXT}

check items in cart
    Log To Console   verify that final products are correct
    Page Should Contain    ${ITEM1_NAME}
    Page Should Contain    ${ITEM2_NAME}
    Page Should Contain    ${ITEM3_NAME}


    
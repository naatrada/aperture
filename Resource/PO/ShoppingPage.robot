*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Keywords ***
Verify page load
    Page Should Contain    ${TEXT_SHOPPING_PAGE}
Check cart before start shopping
    Element Should not Be Visible    ${SHOPPING_BADGE} 
Pick an item to cart
    [Arguments]    ${ITEM_ID}
    ${CART_COUNT}=    Evaluate    ${CART_COUNT} + 1
    Set Global Variable   ${CART_COUNT}
    Click Button    id=${item_id}
    Log To Console    Cart count after adding: ${CART_COUNT}
    Element Should Contain    ${SHOPPING_CART}    ${CART_COUNT}    #check amount in cart
remove the fourth item
    Log To Console   Verify that users can remove a product
    Click button    ${REMOVE_ITEM4_BUTTON} 
    Element Should Contain    ${SHOPPING_CART}    ${CART_COUNT-1}

Reset cart count value
    Set Global Variable     ${CART_COUNT}        0
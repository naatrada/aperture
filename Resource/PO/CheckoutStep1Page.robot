*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Keywords ***
Go to Checkout page
    Click Button    ${CHECKOUT_BUTTON}
    Click Button    ${CONTINUE_BUTTON} 

Check out fail by let every field empty
    Log To Console   verify that users can not checkout with filling incomplete data
    Click Button    ${CONTINUE_BUTTON}
    Page Should Contain    ${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_CASE}

check out fail by let firstname field empty
    Go back
    Click Button    ${CHECKOUT_BUTTON}
    Input Text    ${LAST_NAME_FIELD}    ${LAST_NAME}
    Input Text    ${ZIPCODE_FIELD}    ${ZIPCODE}
    Click Button    ${CONTINUE_BUTTON}
    Page Should Contain    ${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_FIRSTNAME_CASE} 

check out fail by let lastname field empty
    Go back
    Click Button  ${CHECKOUT_BUTTON}
    Input Text    ${FIRST_NAME_FIELD}   ${FIRST_NAME}
    Input Text    ${ZIPCODE_FIELD}      ${ZIPCODE}
    Click Button  ${CONTINUE_BUTTON}
    Page Should Contain    ${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_LASTNAME_CASE}
    
check out fail by let zipcode field empty
    Go back
    Click Button  ${CHECKOUT_BUTTON}
    Input Text    ${FIRST_NAME_FIELD}    ${FIRST_NAME}
    Input Text    ${LAST_NAME_FIELD}     ${FIRST_NAME}
    Click Button  ${CONTINUE_BUTTON}
    Page Should Contain   ${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_ZIPCODE_CASE}

check out success
    Log To Console  Veify that users can checkout when fill complete data
    Wait Until Page Contains    ${CheckoutStep1Page}
    Input Text    ${FIRST_NAME_FIELD}   ${FIRST_NAME}
    Input Text    ${LAST_NAME_FIELD}    ${FIRST_NAME}
    Input Text    ${ZIPCODE_FIELD}      ${ZIPCODE}
    Click Button  ${CONTINUE_BUTTON}
    
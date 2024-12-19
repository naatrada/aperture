*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/InputData.resource

*** Keywords ***
go to Login page
    Go To    ${URL} 
    Maximize Browser Window

verify page load
    Page Should Contain Element   ${USERNAME_FIELD} 

Login fail when let username and password emtpy
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    ${EXPEDTED_ERROR_MESSAGE_LOGNIN_EMPTY_CASE} 
Login
    [Arguments]    ${USERNAME}    ${PASSWORD}    ${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE} 
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Input Password    ${PASSWORD_FIELD}  ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Page Should Contain    ${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE} 
    
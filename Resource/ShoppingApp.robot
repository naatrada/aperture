*** Settings ***
Resource    ../Resource/PO/LoginPage.robot
Resource    ../Resource/PO/ShoppingPage.robot
Resource    ../Resource/PO/OverviewPage.robot
Resource    ../Resource/PO/CheckoutStep1Page.robot
Resource    ../Resource/PO/CheckoutStep2Page.robot

*** Keywords ***

Navigate to Login page
    LoginPage.go to Login page

Verify page load by login an element
    LoginPage.verify page load

login fail cases
    [Arguments]  
    LoginPage.Login fail when let username and password emtpy
    LoginPage.Login   ${INVALID_USERNAME}     ${INVALID_PASSWORD}     ${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE}
    LoginPage.Login    ${INVALID_USERNAME}     ${PASSWORD}    ${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE}
    LoginPage.Login    ${USERNAME}     ${INVALID_PASSWORD}   ${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE}

Login success
    LoginPage.Login    ${USERNAME}     ${PASSWORD}    ${SUCCESS_LOGIN}

Verify shopping page load
    ShoppingPage.Verify page load

Check that cart empty
    ShoppingPage.Check cart before start shopping

pick an item
    [Arguments]    ${ITEM_ID}
    ShoppingPage.Pick an item to cart    ${ITEM_ID}
remove an item
    ShoppingPage.remove the fourth item
Navigate to Overview page
    OverviewPage.Go to Overview page
Check items in cart
    OverviewPage.check items in cart
Reset value on cart
    ${CART_COUNT}    ShoppingPage.Reset cart count value
Go to checkout page
    CheckoutStep1Page.Go to Checkout page

Checkout fail cases
    CheckoutStep1Page.check out fail by let every field empty
    CheckoutStep1Page.check out fail by let firstname field empty
    CheckoutStep1Page.check out fail by let lastname field empty
    CheckoutStep1Page.check out fail by let zipcode field empty

Checkout success
    CheckoutStep1Page.check out success

Overview page
    CheckoutStep2Page.verify overview page load
    CheckoutStep2Page.finish
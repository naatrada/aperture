*** Settings ***
Library    SeleniumLibrary


*** Variables ***
#LOCATOR
${URL}    https://www.saucedemo.com/
${USERNAME_FIELD}    id=user-name
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}    id=login-button
${TEXT_SHOPPING_PAGE}    Products
${SHOPPING_BADGE}        class=shopping_cart_badge
${SHOPPING_CART}         class=shopping_cart_link
${OVERVIEW_PAGE_TEXT}    Your Cart
${CHECKOUT_BUTTON}       id=checkout
${CONTINUE_BUTTON}       id=continue
${FIRST_NAME_FIELD}      id=first-name
${LAST_NAME_FIELD}       id=last-name
${ZIPCODE_FIELD}         id=postal-code
${CheckoutStep1Page}     Checkout: Your Information
#VALUE
${BROWSER}            chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${INVALID_USERNAME}    standard_user123
${INVALID_PASSWORD}    secret_sauce121
${EXPEDTED_ERROR_MESSAGE_LOGNIN_EMPTY_CASE}    Epic sadface: Username is required
${EXPEDTED_ERROR_MESSAGE_LOGIN_INVALID_CASE}  Epic sadface: Username and password do not match any user in this service
${SUCCESS_LOGIN}
${FIRST_NAME}    Natty
${LAST_NAME}     Test
${ZIPCODE}    50000 
${ITEM1_ID}    add-to-cart-sauce-labs-bolt-t-shirt
${ITEM2_ID}    add-to-cart-test.allthethings()-t-shirt-(red)
${ITEM3_ID}    add-to-cart-sauce-labs-backpack
${ITEM4_ID}    add-to-cart-sauce-labs-bike-light
${REMOVE_ITEM4_BUTTON}     id=remove-sauce-labs-bike-light
${ITEM1_NAME}    Sauce Labs Bolt T-Shirt
${ITEM2_NAME}    Test.allTheThings() T-Shirt (Red)
${ITEM3_NAME}    Sauce Labs Backpack
${CART_COUNT}    0
${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_CASE}                  Error: First Name is required
${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_FIRSTNAME_CASE}        Error: First Name is required
${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_LASTNAME_CASE}         Error: Last Name is required 
${EXPEDTED_ERROR_MESSAGE_CASHOUT_EMPTY_ZIPCODE_CASE}          Error: Postal Code is required


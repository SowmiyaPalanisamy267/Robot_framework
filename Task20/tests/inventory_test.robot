*** Settings ***
Library    SeleniumLibrary
Resource   C://Users/colon/PycharmProjects/Task20/resoures/locators.robot
Resource   C://Users/colon/PycharmProjects/Task20/resoures/variables.robot
Resource   ../pages/login_page.robot
Resource    ../pages/inventory_page.robot
Resource    ../pages/cart_page.robot

*** Variables ***

*** Keywords ***

*** Test Cases ***
TC003-Add Sauce Labs Fleece Jacket To Cart
    [Tags]             03
    Open Login Page
    Enter credentials    ${USERNAME}    ${PASSWORD}
    perform login
    Verify inventory Page
    Add Product To Cart    ${PRODUCT_FLEECE_JACKET}
    Cart Badge Should Show    1
    Go To Cart page
    Cart Should Contain Product    ${PRODUCT_FLEECE_JACKET}
    Close Browser


TC004-Add Multiple Products Accumulates Badge Count
    [Tags]             04
    Open Login Page
    Enter credentials    ${USERNAME}    ${PASSWORD}
    perform login
    Verify inventory Page
    Add Product To Cart    ${PRODUCT_FLEECE_JACKET}
    Add Product To Cart    ${PRODUCT_BACKPACK}
    Add Product To Cart    ${PRODUCT_BIKE_LIGHT}
    Cart Badge Should Show    3
    Go To Cart page
    Cart Should Contain Product    ${PRODUCT_BACKPACK}
    Cart Should Contain Product    ${PRODUCT_BIKE_LIGHT}
    Cart Should Contain Product   ${PRODUCT_FLEECE_JACKET}
    Close Browser
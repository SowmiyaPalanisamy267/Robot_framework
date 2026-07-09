*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/login_page.robot
Resource    ../pages/inventory_page.robot
*** Test Cases ***
TC001-Verify Valid Login
    [Tags]             01
    Open Login Page
    Enter credentials    ${USERNAME}    ${PASSWORD}
    perform login
    Verify inventory Page
    Report Success
    Close the Browser

TC002-Verify invalid login and error message
    [Tags]             02
    Open Login Page
    Enter Credentials    ${INVALIDUSN}    ${INVALIDPWD}
    Perform Login
    Error Message Should Be Visible    Epic sadface: Username and password do not match any user in this service
    Close the Browser



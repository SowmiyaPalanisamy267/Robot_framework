*** Settings ***
Library    SeleniumLibrary
Resource   C://Users/colon/PycharmProjects/Task20/resoures/locators.robot
Resource   C://Users/colon/PycharmProjects/Task20/resoures/variables.robot

*** Keywords ***
Open Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-popup-blocking
#    Call Method    ${options}    add_argument    --user-data-dir=/tmp/selenium_profile
    Call Method    ${options}    add_argument    --incognito
    Open Browser    ${BASE_URL}    chrome    options=${options}
    Maximize Browser Window


Enter Credentials
    [Arguments]    ${user}    ${pass}
    Input Text    ${USERNAME_FIELD}    ${user}
    Input Text    ${PASSWORD_FIELD}    ${pass}

Perform Login
    Click Button    ${LOGIN_BUTTON}

Report Success
    Log To Console    Valid login verified — redirected to Products page
    Set Test Message    Valid login verified — redirected to Products page

Error Message Should Be Visible
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${LP_ERROR_MSG}    timeout=${EXPLICIT_WAIT}
    ${actual}=    Get Text    ${LP_ERROR_MSG}
    Should Be Equal    ${actual}    ${expected_text}    msg=Login error mismatch. Expected: '${expected_text}', Got: '${actual}'


Close the Browser
    Close Browser

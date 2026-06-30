*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://robotsparebinindustries.com
${BROWSER}    Chrome
${USERNAME}   maria
${PASSWORD}   thoushallnotpass
${INVALIDUSN}   invalid
${INVALIDPWD}   invalid
${SUCCESS_ELEMENT}    //button[normalize-space()='Submit']
${EXPECTED_ELEMENT}    SUBMIT


*** Test Cases ***
Verify Valid Login
    Open Application
    Perform Login    ${USERNAME}    ${PASSWORD}
    Sleep    5
    Verify Login Success
    Perform Logout

Verify Invalid Login
    Open Application
    Perform Login    ${INVALIDUSN}     ${INVALIDPWD}
    Verify Login Failure
    Close Browser

Verify Empty Field
    Open Application
    Perform Login    ${EMPTY}     ${EMPTY}
    Sleep    5
    Verify empty fields
    Close Browser


*** Keywords ***
Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Perform Login
    [Arguments]    ${user}    ${pass}
    Input Text    xpath://input[@name='username']    ${user}
    Input Text    xpath://input[@name='password']    ${pass}
    Click Button    //button[normalize-space()='Log in']

Verify Login Success
    Wait Until Element Is Visible    ${SUCCESS_ELEMENT}    10s
#    Validation 1
    Element Should Contain    ${SUCCESS_ELEMENT}    ${Expected_element}    
#    validation 2
    Element Should Contain    xpath://span[@class='username']    maria

    Log To Console    Login successful
    Set Test Message    report_message:Login successful

Verify Login Failure
    Wait Until Element Is Visible    //div[contains(@class,'alert') and contains(normalize-space(.),'Invalid')]   10s
    
    #    Validation 1
    Element Should Contain    xpath://div[contains(@class,'alert')]    Invalid username or password.

    Log To Console    Invalid login verified
    Set Test Message    report_message:Invalid login verified

Verify empty fields
    ${is_required}=    Get Element Attribute    xpath://input[@id='username']    required

    #    Validation 1
    Should Be Equal As Strings    ${is_required}    true

    Log To Console    Browser validation triggered for empty field
    Set Test Message    report_message:Empty field verification


Perform Logout
     Click Element    xpath://button[@id='logout']
     Close Browser

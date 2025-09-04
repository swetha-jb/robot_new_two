*** Settings ***
Library    SeleniumLibrary
Resource   locators.resource

*** Keywords ***
Enter The Username
    [Arguments]    ${username}
    Input Text    ${EMAIL_INPUT}    ${username}

Enter The Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click On Sign In Button
    Click Element    ${SIGNIN_BUTTON}
    Sleep    10s


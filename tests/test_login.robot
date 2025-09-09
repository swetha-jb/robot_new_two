*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/login_page.resource

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        chrome
${URL}            https://accounts2.netgear.com/login?redirectUrl=https:%2F%2Finsight.netgear.com%2F&clientId=6dlf5ppqm5oic7hhtk68qrlc9j
${USERNAME}       viku.prod@yopmail.com
${PASSWORD}       Netgear1@

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3s

*** Test Cases ***
Login With Valid Credentials
    Enter The Username    ${USERNAME}
    Enter The Password    ${PASSWORD}
    Click On Sign In Button

*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/login_page.resource

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${URL}        https://accounts2.netgear.com/login?redirectUrl=https:%2F%2Finsight.netgear.com%2F&clientId=6dlf5ppqm5oic7hhtk68qrlc9j
${USERNAME}   viku.prod@yopmail.com
${PASSWORD}   Netgear1@

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    ${headless}=    Set Variable    --headless=new
    ${nosandbox}=    Set Variable    --no-sandbox
    ${devshm}=      Set Variable    --disable-dev-shm-usage
    ${gpu}=         Set Variable    --disable-gpu
    ${remote}=      Set Variable    --remote-debugging-port=9222

    Call Method    ${options}    add_argument    ${headless}
    Call Method    ${options}    add_argument    ${nosandbox}
    Call Method    ${options}    add_argument    ${devshm}
    Call Method    ${options}    add_argument    ${gpu}
    Call Method    ${options}    add_argument    ${remote}

    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Sleep    3s


*** Test Cases ***
Login With Valid Credentials
    Enter The Username    ${USERNAME}
    Enter The Password    ${PASSWORD}
    Click On Sign In Button

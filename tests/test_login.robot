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
    Evaluate    ${options}.add_argument("--headless=new")    sys, selenium.webdriver, ${options}
    Evaluate    ${options}.add_argument("--no-sandbox")      sys, selenium.webdriver, ${options}
    Evaluate    ${options}.add_argument("--disable-dev-shm-usage")    sys, selenium.webdriver, ${options}
    Evaluate    ${options}.add_argument("--disable-gpu")     sys, selenium.webdriver, ${options}
    Evaluate    ${options}.add_argument("--remote-debugging-port=9222")    sys, selenium.webdriver, ${options}

    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Sleep    3s

*** Test Cases ***
Login With Valid Credentials
    Enter The Username    ${USERNAME}
    Enter The Password    ${PASSWORD}
    Click On Sign In Button

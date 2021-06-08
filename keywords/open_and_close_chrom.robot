*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/wait_until.robot

*** Keywords ***
Open Chrome And Go To Home Page
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Home Page Is Visible


Close Chrome
    Close Browser
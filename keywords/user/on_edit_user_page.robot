*** Settings ***
Library    SeleniumLibrary
Resource   ../../keywords/wait_until.robot

*** Keywords ***
Click Go Back To Users Page Button
    Click Element    //*[@class="css-dmf4a8" and @href="/keystone/users"]
    Wait Until Posts Page Is Visible
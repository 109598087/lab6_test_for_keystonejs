*** Settings ***
Library    SeleniumLibrary
Resource   ../../keywords/wait_until.robot


*** Keywords ***
Click Go Back To Categories Page Button
    Click Element    //*[@class="css-dmf4a8" and @href="/keystone/post-categories"]
    Wait Until Posts Page Is Visible
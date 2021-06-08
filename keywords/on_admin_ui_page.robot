*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/wait_until.robot

*** Keywords ***
Click A Dashboard Button
    [Arguments]    ${heading}   ${lable}
    ${dashboardButton} =    Set Variable    //*[contains(@data-section-label,'${heading}')]//*[contains(@class, "dashboard-group__list-label") and text()='${lable}']
    Click Element    ${dashboardButton}
    Wait Until Posts Page Is Visible

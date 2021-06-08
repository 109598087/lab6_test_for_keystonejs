*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/wait_until.robot

*** Keywords ***
Input Email
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@name="password"]    ${password}

Submit Email And Password
    Submit Form

##################################
Click Logo Button
    Click Element    //*[contains(@class, "logo")]
    Wait Until Home Page Is Visible

# sign_in_page -> admin_ui_page
Sign In As Admin
    Input Email    demo@keystonejs.com
    Input Password     demo
    Submit Email And Password
    Wait Until Admin Ui Page Is Visible
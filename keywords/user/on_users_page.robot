*** Settings ***
Library    SeleniumLibrary
Resource    ../wait_until.robot


*** Keywords ***
Click Create User Button
    Click Element    //*[contains(text(), "Create ")]
    Wait Until Create A New User Dialog Is Visible

Input User First Name
    [Arguments]    ${userFirstName}
    Input Text    //*[@name="name.first"]    ${userFirstName}

Input User Last Name
    [Arguments]    ${userLastName}
    Input Text    //*[@name="name.last"]    ${userLastName}

Input User Email
    [Arguments]    ${userEmail}
    ${uuid}=    Evaluate    uuid.uuid4()    modules=uuid
    Input Text    //*[@name="email"]    ${uuid}${userEmail}

Input User Password
    [Arguments]    ${userPassword}
    Input Text    //*[@name="password"]    ${userPassword}

Input User Password Confirm
    [Arguments]    ${userPasswordConfirm}
    Input Text    //*[@name="password_confirm"]    ${userPasswordConfirm}
##########################3
Create A User
    [Arguments]    ${userFirstName}    ${userLastName}    ${userEmail}    ${userPassword}
    Click Create User Button
    Input User First Name    ${userFirstName}
    Input User Last Name    ${userLastName}
    Input User Email    ${userEmail}
    Input User Password    ${userPassword}
    Input User Password Confirm    ${userPassword}
    Submit Form
    Wait Until Edit User Page Is Visible

Verify Users Page Have User
    [Arguments]    ${userFirstName}
    Wait Until Element Is Visible    //*[contains(@href, "/keystone/users/") and contains(text(), "${userFirstName}")]

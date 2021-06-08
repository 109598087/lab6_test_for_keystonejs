*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Enquirie Name
    [Arguments]    ${enquirieName}
    Input Text    //*[@class="form-control" and @name="name.full"]    ${enquirieName}

Input Enquirie Email
    [Arguments]    ${enquirieEmail}
    Input Text    //*[@class="form-control" and @name="email"]    ${enquirieEmail}

Input Enquirie Regarding
    [Arguments]    ${enquirieEmail}
    Click Element    //*[@class="form-control" and @name="enquiryType"]
    Click Element    //*[@value="message" and text()="${enquirieEmail}"]
    Click Element    //*[@class="form-control" and @name="enquiryType"]

Input Enquirie Type
    [Arguments]    ${enquirieMessage}
    Input Text    //*[@class="form-control" and @name="message"]    ${enquirieMessage}

Verify Create Enquirie Successfully
    Wait Until Element Contains    //h1    Success!
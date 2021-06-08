*** Settings ***
Library    SeleniumLibrary
Resource   ../../keywords/wait_until.robot

*** Keywords ***
Click Comment State Select Arrow
    Click Element    //*[contains(@class, "css-1wrt3l9") and @for="commentState"]//*[@class = "Select-arrow"]

Input Select Comment State
    [Arguments]    ${commentState}
    Input Text    //*[@for="commentState"]//*[contains(@aria-activedescendant, "react-select")]    ${commentState}

###########################

Click Go Back To Comments Page Button
    Click Element    //*[@class="css-dmf4a8" and @href="/keystone/post-comments"]
    Wait Until Posts Page Is Visible

Input Comment State
    [Arguments]    ${commentState}
    Click Comment State Select Arrow
    Input Select Comment State    ${commentState}
    Press Keys    //*[@for="commentState"]//*[contains(@aria-activedescendant, "react-select")]    RETURN

Input Comment Content
    [Arguments]    ${commentContent}
    Mouse Down    //div[@role="button" and text()="p"]
    Mouse up    //div[@role="button" and text()="p"]
    Select Frame    //iframe
    Press Keys    //*[@id="tinymce"]    CTRL+a+BACKSPACE
    Input Text    //*[@id="tinymce"]    ${commentContent}
    [Teardown]    Unselect Frame

Verify Edit Comment Successfully
    Wait Until Element Contains    //*[@data-alert-type = "success"]   Your changes have been saved successfully


Verify Edit Comment Author Successfully
    [Arguments]    ${commentAuthor}
    Wait Until Element Contains    //*[contains(@class, "css-1wrt3l9") and @for="author"]//*[@class="Select-value-label"]   ${commentAuthor}

Verify Edit Comment Post Name Successfully
    [Arguments]    ${commentPostName}
    Wait Until Element Contains    //*[contains(@class, "css-1wrt3l9") and @for="post"]//*[@class="Select-value-label"]   ${commentPostName}

Verify Edit Comment State Successfully
    [Arguments]    ${commentState}
    Wait Until Element Contains    //*[contains(@class, "css-1wrt3l9") and @for="commentState"]//*[@class="Select-value-label"]   ${commentState}

Verify Edit Comment Content Successfully
    [Arguments]    ${commentContent}
    Mouse Down    //div[@role="button" and text()="p"]
    Mouse up    //div[@role="button" and text()="p"]
    Select Frame    //iframe
    Wait Until Element Contains    //*[@id="tinymce"]   ${commentContent}
    [Teardown]    Unselect Frame


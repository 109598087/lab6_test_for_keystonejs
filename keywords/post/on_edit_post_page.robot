*** Settings ***
Library    SeleniumLibrary
Resource   ../../keywords/wait_until.robot

*** Keywords ***
Click Go Back To Posts Page Button
    Click Element    //*[@class="css-dmf4a8" and @href="/keystone/posts"]
    Wait Until Posts Page Is Visible

Click Post State Select Arrow
    Click Element    //*[contains(@class, "css-1wrt3l9") and @for="state"]//*[@class = "Select-arrow"]

Input Select Post State
    [Arguments]    ${postState}
    Input Text    //*[@for="state"]//*[contains(@aria-activedescendant, "react-select")]    ${postState}

Click Post Author Select Arrow
    Click Element    //*[contains(@class, "css-1wrt3l9") and @for="author"]//*[@class = "Select-arrow"]

Input Select Post Author
    [Arguments]    ${postAuthor}
    Input Text    //*[@for="author"]//*[contains(@aria-activedescendant, "react-select")]    ${postAuthor}

Click Save Button
    Click Element    //*[contains(@class, "css-2960tt")]

Click Go To Admin Ui Page Button
    Click Element    //*[@title="Dashboard - Demo" and @href="/keystone"]

Click Reset Changes Button
    Click Element    //*[@class="css-rd63ky" and @data-button="reset"]
    Wait Until Reset Warning Dialog Is Visible

Click Reset Button
    Mouse Down    //*[@class="css-t4884" and text()="Reset"]
    Mouse Up    //*[@class="css-t4884" and text()="Reset"]
    Wait Until Edit Post Page Is Visible
###############################
Input Post State
    [Arguments]    ${postState}
    Click Post State Select Arrow
    Input Select Post State    ${postState}
    Press Keys    //*[@for="state"]//*[contains(@aria-activedescendant, "react-select")]    RETURN

Input Post Author
    [Arguments]    ${postAuthor}
    Click Post Author Select Arrow
    Input Select Post Author    ${postAuthor}
    Press Keys    //*[@for="author"]//*[contains(@aria-activedescendant, "react-select")]    RETURN

Input Post Published Date
    [Arguments]    ${publishedDate}
    Press Keys    //*[@for="publishedDate"]//*[@name="publishedDate"]    CTRL+a+BACKSPACE
    Press Keys    //*[@for="publishedDate"]//*[@name="publishedDate"]    CTRL+x
    Input Text    //*[@for="publishedDate"]//*[@name="publishedDate"]    ${publishedDate}
    Press Keys    //*[@for="publishedDate"]//*[@name="publishedDate"]    RETURN
    Click Save Button

Input Post Content Brief
    [Arguments]    ${postContentBrief}
    Mouse Down    //*[@id="mceu_24-0"]
    Mouse up    //*[@id="mceu_24-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-0_ifr")]
    Press Keys    //*[@id="tinymce"]    CTRL+a+BACKSPACE
    Input Text    //*[@id="tinymce"]    ${postContentBrief}
    [Teardown]    Unselect Frame

Input Post Content Extended
    [Arguments]    ${postContentExtended}
    Mouse Down    //*[@id="mceu_50-0"]
    Mouse up    //*[@id="mceu_50-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-1_ifr")]
    Press Keys    //*[@id="tinymce"]    CTRL+a+BACKSPACE
    Input Text    //*[@id="tinymce"]    ${postContentExtended}
    [Teardown]    Unselect Frame

Save Edit Post
    Click Save Button

Reset Changes
    Click Reset Changes Button
    Sleep    5s
    Click Reset Button
    Sleep    5s

Verify Edit Post Successfully
    Wait Until Element Contains    //*[@data-alert-type = "success"]   Your changes have been saved successfully

Verify Edit Post State Successfully
    [Arguments]    ${postState}
    Wait Until Element Contains    //*[contains(@class, "css-1wrt3l9") and @for="state"]//*[@class="Select-value-label"]   ${postState}

Verify Edit Post Author Successfully
    [Arguments]    ${postAuthor}
    Wait Until Element Contains    //*[contains(@class, "css-1wrt3l9") and @for="author"]//*[@class="Select-value-label"]   ${postAuthor}

Verify Edit Post Published Date Successfully
    [Arguments]    ${publishedDate1}
    ${publishedDate2} =    Get Element Attribute   //*[contains(@class, "css-1wrt3l9") and @for="publishedDate"]//*[@name="publishedDate"]    value
    Should Be Equal    ${publishedDate2}    ${publishedDate1}

Verify Edit Post Content Brief Successfully
    [Arguments]    ${postContentBrief}
    Mouse Down    //*[@id="mceu_24-0"]
    Mouse up    //*[@id="mceu_24-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-0_ifr")]
    Wait Until Element Contains    //*[@id="tinymce"]   ${postContentBrief}
    [Teardown]    Unselect Frame

Verify Edit Post Content Extended Successfully
    [Arguments]    ${postContentExtended}
    Mouse Down    //*[@id="mceu_50-0"]
    Mouse up    //*[@id="mceu_50-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-1_ifr")]
    Wait Until Element Contains    //*[@id="tinymce"]   ${postContentExtended}
    [Teardown]    Unselect Frame

Verify Edit Post State Unsuccessfully  # TODO: Draft no
    [Arguments]    ${postState}
    Wait Until Element Does Not Contain    //*[@for="state"]//*[@class="Select-value-label"]   ${postState}

Verify Edit Post Author Unsuccessfully
    [Arguments]    ${postAuthor}
    Wait Until Element Does Not Contain    //*[@for="author"]//*[@class="Select-value-label"]   ${postAuthor}

Verify Edit Post Published Date Unsuccessfully
    [Arguments]    ${publishedDate1}
    ${publishedDate2} =    Get Element Attribute   //*[@for="publishedDate"]//*[@name="publishedDate"]    value
    Should Not Be Equal    lishedDate2}    ${publishedDate1}

Verify Edit Post Content Brief Unsuccessfully
    [Arguments]    ${postContentBrief}
    Mouse Down    //*[@id="mceu_24-0"]
    Mouse up    //*[@id="mceu_24-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-0_ifr")]
    Wait Until Element Does Not Contain    //*[@id="tinymce"]   ${postContentBrief}
    [Teardown]    Unselect Frame

Verify Edit Post Content Extended Unsuccessfully
    [Arguments]    ${postContentExtended}
    Mouse Down    //*[@id="mceu_50-0"]
    Mouse up    //*[@id="mceu_50-0"]
    Select Frame    //iframe[contains(@id, "keystone-html-1_ifr")]
    Wait Until Element Does Not Contain    //*[@id="tinymce"]   ${postContentExtended}
    [Teardown]    Unselect Frame
*** Settings ***
Library  SeleniumLibrary
Library     FakerLibrary
Variables  ../PageObjects/Locators.py

*** Keywords ***

Enter UserName
    [Arguments]     ${username}
    Input Text      ${LoginPageLoginUsername}   ${username}

Enter Password
    [Arguments]      ${password}
    Input Text       ${LoginPageLoginPassword}   ${password}

Click SignIn
    click button     ${LoginPageSignInButton}

Verify Succesful Login
    title should be     Dashboard ‹ My WordPress Website — WordPress

Finish TestCase
    Close All Browsers

Add New Page
    mouse over      ${HomePageNewMenu}
    click element    ${HomePageAddNewPage}
    Sleep   1

Escape Popups
    Press Keys      None       ESCAPE
    click element    ${ClickMenuButton}
    click button    ${ClickCodeEditorButton}
    Sleep   1

Type Content + Title
    ${pageword} =   FakerLibrary.word
            Log     Title used: ${pageword}
    Input Text      ${NewPageAddTitle}      ${pageword}
    Set Suite Variable  ${pageword}

    ${paragraph} =  FakerLibrary.paragraph
            Log     Title used: ${paragraph}
    Input Text      ${NewPageAddContent}  ${paragraph}
    Set Suite Variable  ${paragraph}
    Sleep      1

Publish
    click button    ${PublishButton}
    click button    ${PublishButton2}
    Sleep   1

Open Published Page
    click element   ${ViewPageButton}
    Sleep   3

Check Published Content
    Page Should Contain     ${pageword}
    Page Should Contain     ${paragraph}
    Sleep  2

Repeat New Page Many Times
    Add New Page
    Type Content + Title
    Publish
    Open Published Page
    Check Published Content
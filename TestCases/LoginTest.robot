*** Settings ***
Library  SeleniumLibrary
Library     FakerLibrary
Resource  ../Resources/LoginKeywords.robot
Resource  ../Resources/Common.robot
Test Setup          Start TestCase
Test Teardown       Finish TestCase

*** Variables ***
${Browser}              Chrome
${SiteUrl}              https://katerina-techinterview.otgs.work/wp-admin/
${user}                 katerinaadmin
${pwd}                  Z^Mt.fVQT~oB
#change this value to set the number of pages you want to create in Test Case 3
${CreateNewPageCount}   3

*** Test Cases ***
TC1: Create one New Page + Verify Published
    Enter UserName              ${user}
    Enter Password              ${pwd}
    Click SignIn
    Verify Succesful Login
    Add New Page
    Escape Popups
    Type Content + Title
    Publish
    Open Published Page
    Check Published Content

TC2: Creat X amount of pages
#change the variable creatnewpagecount to the desired number of pages to be created
    Enter UserName              ${user}
    Enter Password              ${pwd}
    Click SignIn
    Verify Succesful Login
    Add New Page
    Escape Popups
    Type Content + Title
    Publish
    Open Published Page
    Check Published Content
    Repeat Keyword  ${CreateNewPageCount}   Repeat New Page Many Times

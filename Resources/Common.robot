*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Start TestCase
    Open Browser    https://katerina-techinterview.otgs.work/wp-admin/      chrome
    Maximize Browser Window
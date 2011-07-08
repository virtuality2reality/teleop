# encoding: UTF-8
Feature: Sign in
  In order to use the application
  As a visitor
  I want to be able to sign in

Scenario: Sign in
  Given I have an "operator" account with "operator1@mail.com" and "secret" credentials
  When I am on the home page
  And I fill in "Email" with "operator1@mail.com"
  And I fill in "Password" with "secret"
  And I press "Login"
  Then I should see "Connecté"

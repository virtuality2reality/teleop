# encoding: UTF-8
Feature: Manage client surveys
  In order to allow operators to make calls for a client
  As an admin
  I want to be able to manage surveys for this client   

Background:
  Given I am logged in as an "admin"
  And the following client exists:
    | name      |
    | DevisProx |

@javascript
Scenario: Create a survey
  When I am on the home page
  And I follow "Clients"
  And I follow "DevisProx"
  And I follow "Créer un nouveau questionnaire"
  And I fill in "Titre" with "Crédit immobilier"
  
  And I follow "Nouvelle section"
  And I fill in the last "Titre" with "Description de votre projet immobilier"
  
  And I follow "Nouvelle question ouverte"
  And I fill in the last "Titre" with "Comment vous appelez-vous ?"
  
  And I follow "Nouvelle question à choix"
  And I fill in the last "Titre" with "Votre projet"
  And I follow "Nouveau choix"
  And I fill in the last "Titre" with "Achat d'un bien"
  And I follow "Nouveau choix"
  And I fill in the last "Titre" with "Rachat de crédit"
  
  And I press "Créer"
  Then I should see "Crédit immobilier"
  And I should see "Description de votre projet immobilier"
  And I should see "Comment vous appelez-vous ?"
  And I should see "Votre projet"
  And I should see "Achat d'un bien"
  And I should see "Rachat de crédit"

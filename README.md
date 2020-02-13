# Adopt Don't Shop Paired Project

The Adopt Don't Shop project is an interactive pet shelter website that allows a user to:
* create, view, edit, and delete pets,
* create, view, edit, and delete adoption shelters,
* create, view, edit, and delete user reviews for adoption shelters,
* favorite and unfavorite pet,
* create adoption applications and, ultimately, adopt pets.

## How to Clone Project to Local Machine
Follow these instructions in your -nix command line terminal:

  1. Clone this repository:
    ```git clone git@github.com:jrsewell400/adopt_dont_shop_paired.git```
    
  1. Install the necessary gems:
    ```bundle install``` &
    ```bundle update```

  1. Initialize the database:
    ```rails db:{create,migrate,seed}```
  
  1. Make a connection with the Rails server:
    ```rails s```
    
  1. Visit your browser, and enter the following into the search bar: 
  ```localhost:3000```
  
  1. Enjoy!


## Skills Gained from this Project

### Rails
* Implement CRUD functionality for a resource using forms (form_tag), buttons, and links
* Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
* Create routes for
  - standalone resources
  - nested resources
* Template a view in Rails using a templating language (eg, `erb`)
* Implement CRUD functionality for nested resources

### ActiveRecord
* Create instance methods on a Rails model that use ActiveRecord associations
* Use built-in ActiveRecord methods to:
* create, read, update, and destroy records in a database
* create records with relationships to other records in a database

### Databases
* Describe Database Relationships, including the following terms:
  - Primary Key
  - Foreign Key
  - One to Many
  - Write migrations to create tables and relationships between tables
  - Describe ORMs and their advantages and use cases

### Testing and Debugging
* Write feature tests utilizing:
  - RSpec and Capybara
  - CSS selectors to target specific areas of a page
  - Use Pry or Byebug in Rails files to get more information about an error
  - Use `save_and_open_page` to view the HTML generated when visiting a path in a feature test
  - Utilize the Rails console as a tool to get more information about the current state of a development database
  - Use `rails routes` to get additional information about the routes that exist in a Rails application

## Link to Application in Production
* https://dashboard.heroku.com/apps/whispering-falls-07428

## Links to Contributor Github Profiles
* Chase Gaddis:  https://github.com/cgaddis36
* Jordan Sewell:  https://github.com/jrsewell400
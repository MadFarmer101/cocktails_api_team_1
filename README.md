# The Midcourse Project | Team 1
### Authors
[Hunter Vitous](https://github.com/hmvitous)
[Kayla Woodbury](https://github.com/kaylawoodbury) 
[Daniel Bryant](https://github.com/DanielGITB)
[Janko Radakovic](https://github.com/MadFarmer101)
[Carlos Delgado](https://github.com/Carltesio)
[Paulo Swärdblad?](https://github.com/pauloswardblad) 
 
## Built with
**Front End:** React v. | CSS  
**Back End:** Ruby 2.5.1 | Rails 6.0.2 
**Testing framework:** Cypress  
**Deployed at:** [Netlify](https://tippler-team1.netlify.app/) and [Heroku](https://cocktails-api-team1.herokuapp.com/).

## The code   
This was our midcourse project at Craft Academy. We used two external API's to create a website where the user can searh for a cocktail and get the ingredients and instructions on how to make it. After that user can see all the options on alcholic beverage from a specific cocktail in System Bolaget store: brand, price, measurment etc.
* [Client](https://github.com/MadFarmer101/cocktails_client_team_1.git)

### External Api's:
[CocktailDB](https://www.thecocktaildb.com/api.php)
[Systembolaget](https://api-portal.systembolaget.se/)

## Getting started
### Dependencies  
* rack-cors
* rest-client
* ruby-measurement
* unitwise
* webmock
* coveralls
* pry-rails
* byebug
* rspec-rails
* shoulda-matchers
* factory_bot_rails


### Setup   
To test this application, fork the repo to your own GitHub account and clone it to your local workspace. </br>
*Note:*Be sure to set up the front end (noted above), in order to fully interact with the application. 
To install all of the dependencies:  
```
$ bundle install 
```
To create a new database with sample data:  
```
$ rails db:create db:migrate db:seed 
```
To run the unit tests:  

```
$ rspec
``` 
  
To start the application and run it on your local host:
```
$ rails s
```

## Updates/Improvements   
- Functionality for a user to log in and keep track of previous search results

## License  
[MIT-license](https://en.wikipedia.org/wiki/MIT_License)

### Acknowledgement  
- Material provided by [Craft Academy](https://craftacademy.se)

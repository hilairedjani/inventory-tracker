# Technologies
    * Framework -> Rails 6.1.4 with SQLite
    * Ruby version -> 2.6.6

# Setting up and running the application
    - Clone the github repo and navigate to the project folder
    - Prepare and populate the database for the project with some data
        - rails db:prepare
    - Run the application and visit the url http://localhost:3000
        - rails s

# Testing
    * Run all tests and make sure all tests pass
        - rails test
    * To test only certain portions of the app, run the test command for that particular component.
        - rails test test/models 
        The above command will only test the application models

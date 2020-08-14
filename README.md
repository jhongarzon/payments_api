# README

This is a ruby on rails api. It includes Graphiti which handles the requests from the clients and includes stripe library to manage the testing payments.

* Ruby version

    2.7.0

* System dependencies

    Graphiti 
    Stripe
    Simple Command (Helps with Authentication)
    jwt (manages the authenthicated Json Web Tokens)

* Configuration

    Edit the database credentials stored in /config/database.yml according to your local environment.

* Database creation

    run rails db:migrate inside the root folder. This command will create the database structure in your local environment. Check if the database is created properly before continue to the next step.

* Database initialization

    run rails db:seed this command will populate the database with dummy data.

    the clients table contains the users that are allowed to login to the react frontend application the password is the same for all "1234567". So check any username and use the default password to authenticate.

* Start the server

    Run "rails s" command to start the puma server. This project is configured to run on the 3001 so make sure it is available.

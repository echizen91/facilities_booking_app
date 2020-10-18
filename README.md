# README

# Initializing of Project
Creating the app:

``` 
rails new facilities_booking_app 
```

Installing webpacker:

``` 
cd facilities_booking_app 
rails webpacker:install 
```

# Creation of models
Creating Rooms model:

``` 
rails generate scaffold Rooms location:string capacity:string classification:string 
```

Creating Users model:

``` 
rails generate scaffold Users name:string department:string 
```

Creating Bookings model:

``` 
rails generate scaffold Bookings users:references rooms:references startdate:datetime enddate:datetime 
```

Migration of models to sqlitedb schema:

``` 
rails db:migrate 
```

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

# Schema
Rooms:
* Location
* Capacity
* Classification
* Primary ID referenced by Booking model

Users:
* Name
* Department
* Primary ID referenced by Booking model

Bookings:
* Reference ID from User
* Reference ID from Room
* Start Date
* End Date

# Validations
- [x] Booking start date cannot be earlier than current time
- [x] Booking end date must be at least 30mins from start date
- [x] New Booking date and time cannot overlap with existing bookings
- [x] User cannot make multiple overlapping room bookings
- [ ] Admin rights for creating new room/user

# Improvements
- [ ] Converting to login basis, so new booking can be directly referenced rather than dropdown list
- [ ] User Interface

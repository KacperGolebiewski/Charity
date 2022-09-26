# Donate-IT
## Getting Started
Clone repository, it's free.

### Prerequisites
You need Maven installed in your IDE, or installed on your OS with TomCat server.

### Installing
Use mysqldump file to create DB. It has been filled up with random data using faker. Run as Spring Boot Application or install by Maven and run on TomCat server.

### Lunching
Type this address in web browser: http://localhost:8080

To be able to receive emails you have to add your google email account in application.properties

Follow this step by step processs to get your username and password:
[link](https://support.google.com/accounts/answer/185833?hl=en)

Register and start to experiment with all functions.

### Login for admin account:
login: admin@admin.com  
pass: admin

## Built With
* Spring Boot
* Hibernate
* Java 16
* HTML
* CSS
* My SQL
* JUnit

## Description
Application where you can simulate to make a donation to institution of your choice. Your donation confirmation will be sent to you onto your mobile. As a regular user you can manage your donations, change status of delivery. As admin, you have dashboard to manage users (enable, block, delete etc.), admins, donations, 'Contact us' messages. You can not delete currently logged admin.

## Features
* Rogistration confirmation via email (token with 15 minute expiration time)
* Reset password function
* Sending Emails
* Sending text messages
* Login redirect according to your role
* Pagination with sorting

## In future
* Rest Controllers
* Learn a front-end framework and rebuild the app



## Author
**Kacper Golebiewski** - [KacperGolebiewski](https://github.com/KacperGolebiewski)

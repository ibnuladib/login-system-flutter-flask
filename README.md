# login-system-flutter-flask

This is a cross-platform login and registration system built with **Flutter** (frontend) and **Flask** (backend) using **MySQL** as the database.

## Features

- User registration (email & password)
- User login
- Password hashing with `werkzeug`
- Cross-platform: Android, Web, Desktop
- API integration with Flask backend

## Setup & Run Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
cd flask
pip install flask flask-cors mysql-connector-python werkzeug
cd ..
cd frontend
flutter pub get
```
Setup MySQL Database

Install MySQL (or MySQL Workbench).

Create a database:

CREATE DATABASE login_system;
USE login_system;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

Update MySQL credentials in flask/app.py:

mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password",
    database="login_system"
)

Run it
```bash
cd flask
flask run --host=0.0.0.0 --port=5000
```
go inside the frontend folder
Android:
```bash
flutter run -d emulator-5554
```
Web:
```bash
flutter run -d chrome
```

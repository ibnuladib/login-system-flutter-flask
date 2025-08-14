from flask import Flask, request, jsonify
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
from flask_cors import CORS

app = Flask(__name__)

db = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "root",
    database = "login_system"
)

cursor = db.cursor(dictionary=True)

# Registration

@app.route("/register", methods=["POST"])
def register():
    data = request.json
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"message": "Email password required"}), 400
    
    cursor.execute(
        "SELECT * FROM users WHERE email=%s", (email)
    )

    if cursor.fetchone():
        return jsonify({"message":"Email already exists"}), 400
    
    hashed_pw = generate_password_hash(password)

    cursor.execute(
        "INSERT INTO users (email,password) VALUES (%s, %s)", (email, hashed_pw)
    )

    db.commit()

    return jsonify({
        "message":"a new account has been registered"
    }), 201


# Login 

@app.route("/login", methods = ["POST"])

def login():
    data = request.json
    email = data.get("email")
    password = data.get("password")

    if not email or password:
        return jsonify({"message": "Email and password required"}), 400

    cursor.execute(
        "SELECT * FROM users WHERE email=%s",(email)
        )

    user = cursor.fetchone()

    if not user or not check_password_hash(user["password"],password):
        return jsonify({"messages": "Invalid credentials"}), 401
    
    return jsonify({"messages":"login sucessful"}),200


if __name__ == "__main__":
    app.run(debug=True)

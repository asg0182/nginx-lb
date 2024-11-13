import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    color = os.getenv("COLOR")
    return f"<p>Hello, World! {color}</p>"

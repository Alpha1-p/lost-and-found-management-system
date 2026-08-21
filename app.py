from flask import Flask
from flask_cors import CORS

from config import Config
from utils.database import db
from models.user import User
from models.item import Item
from models.claim import Claim
from models.notification import Notification

app = Flask(__name__)

app.config.from_object(Config)

CORS(app)

db.init_app(app)

with app.app_context():
    db.create_all()

@app.route("/")
def home():
    return {
        "message": "Lost & Found Backend Running Successfully!"
    }


if __name__ == "__main__":
    app.run(debug=True)
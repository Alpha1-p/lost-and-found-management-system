from flask import Flask
from flask_cors import CORS

from config import Config
from utils.database import db

# Models
from models.user import User
from models.item import Item
from models.claim import Claim
from models.notification import Notification

# Routes
from routes.auth_routes import auth_bp
from routes.item_routes import item_bp
from routes.claim_routes import claim_bp
from routes.notification_routes import notification_bp


app = Flask(__name__)

app.config.from_object(Config)

CORS(
    app,
    resources={
        r"/*": {
            "origins": "*"
        }
    }
)

db.init_app(app)


# Register blueprints
app.register_blueprint(auth_bp)
app.register_blueprint(item_bp)
app.register_blueprint(claim_bp)
app.register_blueprint(notification_bp)


# Create database tables
with app.app_context():
    db.create_all()


@app.route("/")
def home():
    return {
        "message": "Lost & Found Backend Running Successfully!"
    }


if __name__ == "__main__":
    app.run(debug=True)
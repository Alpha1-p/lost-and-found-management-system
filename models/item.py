from utils.database import db
from datetime import datetime


class Item(db.Model):
    __tablename__ = "items"

    id = db.Column(db.Integer, primary_key=True)

    user_id = db.Column(
        db.Integer,
        db.ForeignKey("users.id"),
        nullable=False
    )

    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)

    category = db.Column(db.String(50), nullable=False)

    item_type = db.Column(db.String(20), nullable=False)
    # Lost or Found

    status = db.Column(
        db.String(20),
        default="Pending"
    )

    location = db.Column(db.String(100))

    image = db.Column(db.String(255))

    created_at = db.Column(
        db.DateTime,
        default=datetime.utcnow
    )

    user = db.relationship("User", backref="items")

    def to_dict(self):
        return {
            "id": self.id,
            "title": self.title,
            "description": self.description,
            "category": self.category,
            "item_type": self.item_type,
            "status": self.status,
            "location": self.location,
            "image": self.image,
            "created_at": self.created_at,
            "user_id": self.user_id
        }
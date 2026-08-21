from flask import jsonify

from utils.database import db
from models.item import Item


def create_item(data):
    user_id = data.get("user_id")
    title = data.get("title")
    description = data.get("description")
    category = data.get("category")
    item_type = data.get("item_type")
    location = data.get("location")
    image = data.get("image")

    if not user_id or not title or not description or not category or not item_type:
        return jsonify({
            "message": "user_id, title, description, category and item_type are required"
        }), 400

    item = Item(
        user_id=user_id,
        title=title,
        description=description,
        category=category,
        item_type=item_type,
        status="Pending",
        location=location,
        image=image
    )

    db.session.add(item)
    db.session.commit()

    return jsonify({
        "message": "Item created successfully",
        "item": item.to_dict()
    }), 201


def get_all_items():
    items = Item.query.order_by(
        Item.created_at.desc()
    ).all()

    return jsonify({
        "items": [
            item.to_dict()
            for item in items
        ]
    }), 200


def get_item(item_id):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    return jsonify({
        "item": item.to_dict()
    }), 200


def update_item(item_id, data):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    if "title" in data:
        item.title = data["title"]

    if "description" in data:
        item.description = data["description"]

    if "category" in data:
        item.category = data["category"]

    if "item_type" in data:
        item.item_type = data["item_type"]

    if "status" in data:
        item.status = data["status"]

    if "location" in data:
        item.location = data["location"]

    if "image" in data:
        item.image = data["image"]

    db.session.commit()

    return jsonify({
        "message": "Item updated successfully",
        "item": item.to_dict()
    }), 200


def delete_item(item_id):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    db.session.delete(item)
    db.session.commit()

    return jsonify({
        "message": "Item deleted successfully"
    }), 200
from flask import jsonify

from utils.database import db
from models.item import Item


def create_item(data, user_id):
    try:
        item = Item(
            user_id=user_id,
            title=data.get("title"),
            description=data.get("description"),
            category=data.get("category"),
            item_type=data.get("item_type"),
            status=data.get("status", "Pending"),
            location=data.get("location"),
            image=data.get("image")
        )

        if not item.title:
            return jsonify({"message": "Title is required"}), 400

        if not item.description:
            return jsonify({"message": "Description is required"}), 400

        if not item.category:
            return jsonify({"message": "Category is required"}), 400

        if not item.item_type:
            return jsonify({"message": "Item type is required"}), 400

        db.session.add(item)
        db.session.commit()

        return jsonify({
            "message": "Item created successfully",
            "item": item.to_dict()
        }), 201

    except Exception as e:
        db.session.rollback()

        return jsonify({
            "message": "Failed to create item",
            "error": str(e)
        }), 500


def get_all_items():
    try:
        items = Item.query.order_by(
            Item.created_at.desc()
        ).all()

        return jsonify({
            "items": [item.to_dict() for item in items]
        }), 200

    except Exception as e:
        return jsonify({
            "message": "Failed to retrieve items",
            "error": str(e)
        }), 500


def get_item(item_id):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    return jsonify({
        "item": item.to_dict()
    }), 200


def update_item(item_id, data, user_id):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    if item.user_id != user_id:
        return jsonify({
            "message": "You are not allowed to update this item"
        }), 403

    item.title = data.get("title", item.title)
    item.description = data.get(
        "description",
        item.description
    )
    item.category = data.get(
        "category",
        item.category
    )
    item.item_type = data.get(
        "item_type",
        item.item_type
    )
    item.status = data.get(
        "status",
        item.status
    )
    item.location = data.get(
        "location",
        item.location
    )
    item.image = data.get(
        "image",
        item.image
    )

    db.session.commit()

    return jsonify({
        "message": "Item updated successfully",
        "item": item.to_dict()
    }), 200


def delete_item(item_id, user_id):
    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    if item.user_id != user_id:
        return jsonify({
            "message": "You are not allowed to delete this item"
        }), 403

    db.session.delete(item)
    db.session.commit()

    return jsonify({
        "message": "Item deleted successfully"
    }), 200
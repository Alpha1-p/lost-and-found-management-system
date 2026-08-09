from flask import Blueprint, request

from controllers.item_controller import (
    create_item,
    get_all_items,
    get_item,
    update_item,
    delete_item
)


item_bp = Blueprint(
    "items",
    __name__,
    url_prefix="/api/items"
)


@item_bp.route("/", methods=["POST"])
def create():
    data = request.get_json() or {}

    # Temporary user ID for API testing.
    # We will replace this with authenticated user information.
    user_id = data.get("user_id")

    if not user_id:
        return {
            "message": "user_id is required"
        }, 400

    return create_item(data, user_id)


@item_bp.route("/", methods=["GET"])
def get_all():
    return get_all_items()


@item_bp.route("/<int:item_id>", methods=["GET"])
def get_one(item_id):
    return get_item(item_id)


@item_bp.route("/<int:item_id>", methods=["PUT"])
def update(item_id):
    data = request.get_json() or {}

    user_id = data.get("user_id")

    if not user_id:
        return {
            "message": "user_id is required"
        }, 400

    return update_item(
        item_id,
        data,
        user_id
    )


@item_bp.route("/<int:item_id>", methods=["DELETE"])
def delete(item_id):
    data = request.get_json() or {}

    user_id = data.get("user_id")

    if not user_id:
        return {
            "message": "user_id is required"
        }, 400

    return delete_item(
        item_id,
        user_id
    )
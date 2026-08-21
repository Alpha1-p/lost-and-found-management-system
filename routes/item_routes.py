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
    return create_item(data)


@item_bp.route("/", methods=["GET"])
def get_all():
    return get_all_items()


@item_bp.route("/<int:item_id>", methods=["GET"])
def get_one(item_id):
    return get_item(item_id)


@item_bp.route("/<int:item_id>", methods=["PUT"])
def update(item_id):
    data = request.get_json() or {}
    return update_item(item_id, data)


@item_bp.route("/<int:item_id>", methods=["DELETE"])
def delete(item_id):
    return delete_item(item_id)
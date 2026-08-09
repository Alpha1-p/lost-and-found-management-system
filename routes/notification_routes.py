from flask import Blueprint, request

from controllers.notification_controller import (
    create_notification,
    get_user_notifications,
    mark_notification_read
)


notification_bp = Blueprint(
    "notifications",
    __name__,
    url_prefix="/api/notifications"
)


@notification_bp.route("/", methods=["POST"])
def create():
    data = request.get_json() or {}

    return create_notification(data)


@notification_bp.route("/user/<int:user_id>", methods=["GET"])
def get_user(user_id):
    return get_user_notifications(user_id)


@notification_bp.route(
    "/<int:notification_id>/read",
    methods=["PUT"]
)
def mark_read(notification_id):
    return mark_notification_read(
        notification_id
    )
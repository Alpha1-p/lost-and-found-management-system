from flask import jsonify

from utils.database import db
from models.notification import Notification


def create_notification(data):
    user_id = data.get("user_id")
    message = data.get("message")
    notification_type = data.get(
        "notification_type",
        "General"
    )

    if not user_id or not message:
        return jsonify({
            "message": "user_id and message are required"
        }), 400

    notification = Notification(
        user_id=user_id,
        message=message,
        notification_type=notification_type,
        is_read=False
    )

    db.session.add(notification)
    db.session.commit()

    return jsonify({
        "message": "Notification created successfully",
        "notification": notification.to_dict()
    }), 201


def get_user_notifications(user_id):
    notifications = Notification.query.filter_by(
        user_id=user_id
    ).order_by(
        Notification.created_at.desc()
    ).all()

    return jsonify({
        "notifications": [
            notification.to_dict()
            for notification in notifications
        ]
    }), 200


def mark_notification_read(notification_id):
    notification = Notification.query.get(
        notification_id
    )

    if not notification:
        return jsonify({
            "message": "Notification not found"
        }), 404

    notification.is_read = True

    db.session.commit()

    return jsonify({
        "message": "Notification marked as read",
        "notification": notification.to_dict()
    }), 200
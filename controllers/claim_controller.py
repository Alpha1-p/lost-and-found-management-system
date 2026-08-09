from flask import jsonify

from utils.database import db
from models.claim import Claim
from models.item import Item


def create_claim(data):

    item_id = data.get("item_id")
    user_id = data.get("user_id")
    message = data.get("message")

    if not item_id:
        return jsonify({
            "message": "item_id is required"
        }), 400

    if not user_id:
        return jsonify({
            "message": "user_id is required"
        }), 400

    if not message:
        return jsonify({
            "message": "message is required"
        }), 400

    item = Item.query.get(item_id)

    if not item:
        return jsonify({
            "message": "Item not found"
        }), 404

    claim = Claim(
        item_id=item_id,
        user_id=user_id,
        message=message,
        status="Pending"
    )

    try:
        db.session.add(claim)
        db.session.commit()

        return jsonify({
            "message": "Claim submitted successfully",
            "claim": claim.to_dict()
        }), 201

    except Exception as e:
        db.session.rollback()

        return jsonify({
            "message": "Failed to submit claim",
            "error": str(e)
        }), 500


def get_all_claims():

    try:
        claims = Claim.query.order_by(
            Claim.created_at.desc()
        ).all()

        return jsonify({
            "claims": [
                claim.to_dict()
                for claim in claims
            ]
        }), 200

    except Exception as e:

        return jsonify({
            "message": "Failed to retrieve claims",
            "error": str(e)
        }), 500


def update_claim(claim_id, data):

    claim = Claim.query.get(claim_id)

    if not claim:
        return jsonify({
            "message": "Claim not found"
        }), 404

    status = data.get("status")

    if status:
        claim.status = status

    try:
        db.session.commit()

        return jsonify({
            "message": "Claim updated successfully",
            "claim": claim.to_dict()
        }), 200

    except Exception as e:
        db.session.rollback()

        return jsonify({
            "message": "Failed to update claim",
            "error": str(e)
        }), 500
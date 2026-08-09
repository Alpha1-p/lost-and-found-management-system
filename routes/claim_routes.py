from flask import Blueprint, request, jsonify

from controllers.claim_controller import (
    create_claim,
    get_all_claims,
    update_claim
)


claim_bp = Blueprint(
    "claims",
    __name__,
    url_prefix="/api/claims"
)


@claim_bp.route("/", methods=["POST"])
def create():
    data = request.get_json(silent=True)

    if not isinstance(data, dict):
        return jsonify({
            "message": "Request body must be valid JSON"
        }), 400

    return create_claim(data)


@claim_bp.route("/", methods=["GET"])
def get_all():
    return get_all_claims()


@claim_bp.route("/<int:claim_id>", methods=["PUT"])
def update(claim_id):
    data = request.get_json(silent=True)

    if not isinstance(data, dict):
        return jsonify({
            "message": "Request body must be valid JSON"
        }), 400

    return update_claim(
        claim_id,
        data
    )
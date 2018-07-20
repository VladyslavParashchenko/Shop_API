# frozen_string_literal: true

module Json_Helper
  def render_collection_pagination(resources)
    render json: resources.page(params[:page]).per(params[:per])
  end
  def render_collection_all_elements(resources)
    render json: resources
  end

  def render_item(item)
    if item.errors.empty?
      render json: item
    else
      render json: { errors: item.errors }, status: 400
    end
  end

  def render_error(errors, status)
    render json: { errors: errors }, status: status
  end
  def render_charge(charge)
    render json: { status: charge.status, amount: charge.amount, description: charge.description, destination_amount: charge.destination.amount }
  end
end

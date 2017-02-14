class ContactSharesController < ApplicationController
  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
      json: contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  # def index
  #   contact_share = ContactShare.all
  #   render json: contact_share
  # end

  def destroy
    contact_share = ContactShare.destroy(params[:id])
    render json: contact_share
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end

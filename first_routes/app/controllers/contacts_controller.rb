class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    contacts = user.contacts + user.shared_contacts

    render json: contacts
  end

  # def new
  #   render text: "I'm in da new action!"
  # end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  # def edit
  #   render text: "I'm in da edit action!"
  # end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.destroy(params[:id])
    render json: contact
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end

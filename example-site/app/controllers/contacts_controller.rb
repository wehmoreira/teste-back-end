class ContactsController < ApplicationController
  def index
  end

  def new
  end

  def sobre
  end

  def create
    @contact = Contact.new(permitted_params)
    @contact.save ? flash[:success] = 'Contato incluído!' : flash[:error] = @contact.errors.full_messages.to_sentence
    redirect_to new_contact_path
  end

  private

  def permitted_params
    params.require(:contact).merge('guid' => cookies['guid']).permit(:email, :nome, :guid)
  end
end

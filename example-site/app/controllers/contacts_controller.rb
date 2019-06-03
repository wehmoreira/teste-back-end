class ContactsController < ApplicationController
  def index
  end

  def new
  end

  def sobre
  end

  def create
    @contact = Contact.new(permitted_params)
    @contact.save ? flash[:success] = 'Contato incluído!' : flash[:error] = 'Erro ao cadastrar o contato!'
    redirect_to new_contact_path
  end

  private

  def permitted_params
    params.require(:contact).permit(:email, :name, :guid)
  end
end

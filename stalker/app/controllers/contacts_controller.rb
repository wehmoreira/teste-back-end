class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    flash[:info] = 'Não há nenhum registro no momento' if @contacts.blank?
  end
end

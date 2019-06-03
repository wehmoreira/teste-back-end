class Contact < StalkerBase
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'e-mail inválido!' } 
  validates :name, presence: true
  validates :guid, presence: true, format: { with: /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/, message: 'Ocorreu um erro. Tente novamente mais tarde' }
end

class Contact < StalkerBase
  validates :email, presence: { message: 'deve ser preenchido!' }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'inválido!' }, uniqueness: { message: 'já existente!' }
  validates :nome, presence: { message: 'deve ser preenchido!' }
  validates :guid, presence: true, format: { with: /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/, message: 'Ocorreu um erro. Tente novamente mais tarde' }
end

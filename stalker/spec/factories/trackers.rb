FactoryBot.define do
  require 'securerandom'
  factory :tracker do
    guid { SecureRandom.uuid }
    url { "http://teste.com/#{['home', 'sobre', 'contato'].sample}" }
    datetime { Time.now.strftime("%Y-%-m-%-d %-H:%-M:%-S") }
  end
end

FactoryBot.define do
  factory :contact do
    email { "meuemail#{rand(100)}@dominio.com" }
    nome { "Lorem Ipsum Dolor Sit Amet" }
    guid { "aa5bbb17-cdb9-4618-abfa-db6dd2e00844" }
  end
end

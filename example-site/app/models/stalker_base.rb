class StalkerBase < ApplicationRecord
  self.abstract_class = true
  establish_connection YAML::load(ERB.new(File.read(Rails.root.join("..", "stalker", "config", "database.yml"))).result)[Rails.env]
end

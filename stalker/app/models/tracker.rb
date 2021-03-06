class Tracker < ApplicationRecord
  require 'uri'
  validates :guid, presence: true, format: { with: /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/, message: 'guid inválido' }
  validates :url, presence: true
  validates :datetime, presence: true, format: { with: /\d{4}-\d\d?-\d\d? \d\d?:\d\d?:\d\d?/ }
  validate :url_format

  def url_format
    uri = URI.parse(url)
    raise URI::InvalidURIError unless uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    errors.add(:url, 'url inválida')
  end
end

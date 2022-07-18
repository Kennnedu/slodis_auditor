class Auditor < ApplicationRecord
  has_many :products, dependent: :destroy

  def token
    @token ||= JWT.encode(as_json(only: %i[id name]), Rails.application.secrets.secret_key_base)
  end

  def self.authenticate(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    Auditor.find_by!(payload)
  end
end

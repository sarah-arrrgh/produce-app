class Inquiry
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :subject, type: String
  field :message, type: String

  validates :email, presence: true, format: /\A.+@.+\z/
  validates :subject, presence: true, length: { in: 4..32 }
  validates :message, presence: true, length: { minimum: 12 }
end

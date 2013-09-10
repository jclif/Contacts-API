class User < ActiveRecord::Base
  attr_accessible :name, :email
  validates :email, :uniqueness => true

  has_many(
  :contacts,
  class_name: "Contact",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many :shares, through: :contacts
end

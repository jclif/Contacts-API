class Group < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to(
    :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
    :groupings,
    class_name: "Grouping",
    primary_key: :id,
    foreign_key: :group_id
  )

  # has many contacts through groupings
  has_many :contacts, through: :grouping

end

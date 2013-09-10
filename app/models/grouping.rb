class Grouping < ActiveRecord::Base
  attr_accessible :group_id, :contact_id
  validates :group_id, :contact_id, presence: true

  belongs_to(
    :contact,
    class_name: "Contact",
    foreign_key: :contact_id,
    primary_key: :id
  )

  belongs_to(
    :group,
    class_name: "Group",
    foreign_key: :group_id,
    primary_key: :id
  )

  has_one(
    :group_user,
    through: :group

  )

end

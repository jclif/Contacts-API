class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id
  validates :name, :email, :user_id, presence: true

  belongs_to(
  :users,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many(
  :shares,
  class_name: "ContactShare",
  foreign_key: :contact_id,
  primary_key: :id
  )

  def self.contacts_for_user_id(user_id)
    Contact.find_by_sql([<<-SQL, user_id, user_id]) #[user_id, user_id])
    SELECT
      c.*
    FROM
      contacts as c
    LEFT JOIN
      contact_shares as cs
    ON
      c.id = cs.contact_id
    WHERE
      c.user_id = ?
    OR
      cs.user_id = ?2
    SQL
  end
end

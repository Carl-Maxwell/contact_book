class Favorite < ActiveRecord::Base
  validates :contact_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true, uniqueness: {scope: :contact_id}

  belongs_to(
    :contact,
    foreign_key: :contact_id,
    class_name: "Contact",
    primary_key: :id
  )

  belongs_to(
    :user,
    foreign_key: :user_id,
    class_name: "User",
    primary_key: :id
  )
end

class Contact < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: {scope: :email}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {scope: :user_id}

  has_many :comments, as: :commentable

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id
  )

  has_many(
    :shared_users,
    through: :contact_shares,
    source: :user
  )

  has_many(
    :favorites,
    class_name: "Favorite",
    foreign_key: :contact_id,
    primary_key: :id
  )

end

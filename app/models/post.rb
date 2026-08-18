class Post < ApplicationRecord
  enum(:status, { draft: "draft", published: "published" })
  belongs_to(:category, optional: true)
  has_many(:post_tags, dependent: :destroy)
  has_many(:tags, through: :post_tags)
  belongs_to(:user, optional: true)
  has_many(:comments, dependent: :destroy)

  validates(:title, presence: true)
end

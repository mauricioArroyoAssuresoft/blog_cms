class Post < ApplicationRecord
  enum(:status, { draft: "draft", published: "published" })
  belongs_to(:category, optional: true)
end

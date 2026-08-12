class Post < ApplicationRecord
  enum(:status, { draft: "draft", published: "published"})
end

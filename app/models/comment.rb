class Comment < ApplicationRecord
  belongs_to :article     # Связь с молделью Article
  # "принадлежит : статье"
end

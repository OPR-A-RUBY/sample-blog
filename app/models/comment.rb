class Comment < ApplicationRecord
  validates :autor, presence: true
  validates :body, presence: true
  belongs_to :article     # Связь с молделью Article
  # "принадлежит : статье"
end

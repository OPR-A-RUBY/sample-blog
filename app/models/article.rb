class Article < ApplicationRecord
  validates :title, presence: true  # Валидация на непустое поле
  validates :text, presence: true   # ... аналогично.
  has_many :comments                # Связь с молделью Comment
end

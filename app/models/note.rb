class Note < ApplicationRecord
  validates :title, :text, presence: true
end

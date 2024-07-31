class Note < ApplicationRecord
  validates :title, :text, presence: true

  broadcasts_to -> (note) { "notes" }, inserts_by: :prepend
end

class Api::V1::Todolist < ApplicationRecord
  validates :title, presence: true

end

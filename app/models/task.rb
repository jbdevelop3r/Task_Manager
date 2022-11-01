class Task < ApplicationRecord
  belongs_to :category

  validates :task, presence: true, length: { minimum: 4, maximum: 50 }
  validates :details, presence: true, length: { minimum: 4, maximum: 50 }
  validates :deadline, presence: true
end

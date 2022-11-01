class Category < ApplicationRecord

    has_many :tasks, dependent: :destroy
    belongs_to :user

    validates :title, presence: true, length: { minimum: 2, maximum: 25 }
end

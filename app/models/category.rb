class Category < ApplicationRecord

    has_many :tasks, dependent: :destroy
    belongs_to :user

    validates :title, presence: true, uniqueness: { scope: :user, case_sensitive: false}, length: { minimum: 2, maximum: 25 }
end

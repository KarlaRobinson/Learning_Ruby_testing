class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :votes

  validates :text, presence: true
  validates :text, uniqueness: true
end

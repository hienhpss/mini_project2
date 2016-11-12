class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
	belongs_to :category, optional: true
	delegate :name, :to => :category, :prefix => true,
 :allow_nil => true
end

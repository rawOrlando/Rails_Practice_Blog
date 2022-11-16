class Article < ApplicationRecord
	# First one writen like a method to remind me what 
	# it is. Secound way of writing it is standard in ruby.
	validates(:title, presence: true, length: {minimum: 6, maximum: 100})
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
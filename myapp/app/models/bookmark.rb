class Bookmark < ApplicationRecord
	validates :author, presence: true
	validates :title, presence: true, uniqueness: true
	validates :url, format: /\A#{URI::regexp(%w(http https))}\z/, presence: true, uniqueness: true
end

class Fleet < ActiveRecord::Base
	belongs_to :users

	validates :name, :presence => true, length: { maximum: 255 }
end

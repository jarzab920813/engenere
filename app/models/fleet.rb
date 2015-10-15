class Fleet < ActiveRecord::Base
	def index
		@fleets = Fleets.all
	end
	
	def show
		@fleets = Fleets.all
	end
end

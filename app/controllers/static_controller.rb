class StaticController < ApplicationController
	def about
		render 'about'
	end
	def team
		render 'team'
	end
	def portfolio
		render 'portfolio'
	end
	def policies
		render 'policies'
	end
	def join
		render 'join'
	end
end
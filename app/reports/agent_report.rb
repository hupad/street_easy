class AgentReport
	def get_top_five_agents_by_average_sale_price
		@top_five_agents = Sale.joins(:agent)
								.select(" concat(agents.first_name,' ', agents.last_name) as full_name ,AVG(sales.price) as avg_price ")
								.group('full_name')
								.order('avg_price DESC')
								.limit(5)
								.to_a
	end

	def get_top_five_agents_by_rating
		@top_five_agents_by_rating = Review.joins(:agent)
											.select(" concat(agents.first_name, ' ', agents.last_name) as full_name , AVG(reviews.rating) as avg_rating ")
											.group('full_name')
											.order('avg_rating DESC')
											.limit(5)
											.to_a
	end

	def get_top_agent_by_broker_by_rating
		@top_agent_by_broker = Agent.select('T.*')
									.from( 
										Agent.joins(:reviews)
										.select("concat( agents.first_name,' ', agents.last_name) as full_name, brokerage, AVG(reviews.rating) as avg_rating")
										.group('full_name'), :T
									).group(:brokerage)
									.order('avg_rating DESC')
	end

	def get_top_agents_by_broker_by_price
		@top_agent_by_broker = Agent.select('T.*')
									.from( 
										Agent.joins(:sales)
										.select("concat( agents.first_name,' ', agents.last_name) as full_name, brokerage, AVG(sales.price) as avg_price")
										.group('full_name'), :T
									).group(:brokerage)
									.order('avg_price DESC')
	end
end
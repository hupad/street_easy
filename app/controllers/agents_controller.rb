class AgentsController < ApplicationController
	before_action :agent_report

	def	topfive
		@top_five_agents = @agent_report.get_top_five_agents_by_average_sale_price()
	end

	def topfivebyrating
		@top_five_by_rating = @agent_report.get_top_five_agents_by_rating()
	end

	def topagentrating
		@top_agent_by_rating_per_broker = @agent_report.get_top_agent_by_broker_by_rating()
	end

	def topagentprice
		@top_agent_by_price_per_broker = @agent_report.get_top_agents_by_broker_by_price()
	end

	private
	def agent_report
		@agent_report = AgentReport.new
	end

end
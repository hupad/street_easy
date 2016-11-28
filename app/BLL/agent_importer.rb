class AgentImporter
    
    def setup_agent agent

        return nil unless agent

        existing_agent = find_existing_agent agent

        return existing_agent if existing_agent

        new_agent = agent["agent"]

        Agent.create!(new_agent)
    end

    def find_existing_agent agent

    	agents = Agent.where(
    									brokerage: agent["agent"]["brokerage"], 
    									first_name: agent["agent"]["first_name"],
    									last_name: agent["agent"]["last_name"]
    					).to_a
      
      return agents.first if agents.count > 0

    end

end
class DataImporter

	def import_data sale
		new_agent     = setup_agent sale["sale"]["agent"]
		new_review    = setup_review sale["sale"]["review"], new_agent
		new_property  = setup_property sale["sale"]["property"]
		      
		setup_sale sale["sale"], new_property, new_agent
	end


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

    def setup_review review, agent

    		return nil unless review

        new_review = review["review"]
        new_review["agent_id"] = agent ? agent.id : nil

        Review.create!(new_review)

    end

    def setup_property property

     	return nil unless property

       new_property = property["property"]

      property = Property.create do |p|
	      p.address = new_property["address"]
	      p.city = new_property["city"]
	      p.property_id = new_property["id"]
	      p.state = new_property["state"]
	      p.unit = new_property["unit"]
	      p.zip_code = new_property["zip_code"]
      end

      property

    end

    def setup_sale sale, property, agent

        new_sale = Sale.new property: property, agent: agent

        new_sale.price = sale["price"]

        puts "Sale has been created" if new_sale.save!

    end

end
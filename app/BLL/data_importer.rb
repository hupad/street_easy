class DataImporter

	def import_data sale
		new_agent     = setup_agent sale["sale"]["agent"]
		new_review    = setup_review sale["sale"]["review"], new_agent
		new_property  = setup_property sale["sale"]["property"]
		      
		setup_sale sale["sale"], new_property, new_agent
	end


    def setup_agent agent
    	agent_importer = AgentImporter.new
    	agent_importer.setup_agent agent
    end

    def setup_review review, agent
    	review_importer = ReviewImporter.new
    	review_importer.setup_review review, agent
    end

    def setup_property property
    	property_importer = PropertyImporter.new
    	property_importer.setup_property property
    end

    def setup_sale sale, property, agent
    	sale_importer = SaleImporter.new
    	sale_importer.setup_sale sale, property, agent
    end

end
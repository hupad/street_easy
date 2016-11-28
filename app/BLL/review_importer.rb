class ReviewImporter

    def setup_review review, agent

    		return nil unless review

        new_review = review["review"]
        new_review["agent_id"] = agent ? agent.id : nil

        Review.create!(new_review)

    end
    
end
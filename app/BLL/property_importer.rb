class PropertyImporter
	
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

end
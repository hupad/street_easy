class SaleImporter

    def setup_sale sale, property, agent

        new_sale = Sale.new property: property, agent: agent

        new_sale.price = sale["price"]

        puts "Sale has been created" if new_sale.save!

    end

end
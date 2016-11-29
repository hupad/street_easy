require './app/BLL/data_importer.rb'

namespace :data do

    desc "Setup sample data from a sample json file"
    task :setup, [:file] => :environment do |t, args|

        abort("There is no file specified. No data to import!") unless args[:file]

        file = args[:file]
        json = open(file).read

        sales = JSON.parse(json)
        
        data_importer = DataImporter.new

        sales.each do |sale|
          data_importer.import_data sale
        end
        puts "FINISHED IMPORTING DATA INTO MySQL."
    end

end
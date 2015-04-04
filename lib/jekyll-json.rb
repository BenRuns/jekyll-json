require 'yaml'
require 'csv'
require 'json'



module Jekyll

    class ConvertYamlToCsvJson < Generator

        safe true

        def generate(site)
            files_to_generate = YAML.load_file(File.join(site.source, '_config.yml'))
            files_to_generate['serve-json-csv'].each do |options| 
                yml_file = YAML.load_file(File.join(site.source, options['origin']))
                headers = options['headers']
                path_to_destination = File.join(site.source, options['destination'] + '/index')
                if options['csv']  == true 
                    convert_yaml_to_csv(yml_file, path_to_destination, headers)
                end
                if options['json'] == true 
                    convert_yaml_to_json(yml_file, path_to_destination, headers, options['filter-json'])
                end
            end
        end

        def convert_yaml_to_csv(yml_file, path_to_destination, headers)
            CSV.open(path_to_destination + '.csv', "wb") do |csv|
              csv << headers
              yml_file.each do |data|
                row = []
                headers.each { |header| data[header] ? row << data[header] : row << nil }
                csv << row
              end
            end
        end 

        def convert_yaml_to_json(yml_file, path_to_destination, headers, filter_options )
            File.open(path_to_destination + '.json', 'wb') do |json|
                if filter_options = true
                yml_file = yml_file.collect do |entry| 
                                entry.select{ |key, value| headers.include? key  }
                             end
                end
                json << JSON.dump(yml_file)
            end
        end 
    end
end
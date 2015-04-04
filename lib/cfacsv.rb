require 'yaml'
require 'csv'
require 'json'



module Jekyll

    class MakeCsvProjectFile < Generator

        safe true

        def generate(site)
            
            yml_file = YAML.load_file(File.join(site.source, '_data/projects.yml'))
            headers = %w[name description link_url code_url type categories status]
            path_to_destination = File.join(site.source,"projects/index")
            convert_yaml_to_csv(yml_file, path_to_destination, headers)
            convert_yaml_to_json(yml_file, path_to_destination)
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

        def convert_yaml_to_json(yml_file, path_to_destination, headers)
            File.open(path_to_destination + '.json', 'wb') do |json|
                cleaned_yml = yml_file.collect do |entry| 
                                entry.collect{ |key, value| if key in headers  }  }
                             end
                json << JSON.dump(cleaned_yml)
            end
        end 
    end
end

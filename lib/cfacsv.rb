require 'yaml'
require 'csv'



module Jekyll

    class MakeCsvProjectFile < Generator

        safe true

        def generate(site)
            
            yml_file = YAML.load_file(File.join(site.source, '_data/projects.yml'))
            headers = %w[name description link_url code_url type categories status]
            path_to_destination = File.join(site.source,"projects/index.csv")
            convert_yaml_to_csv(yml_file, path_to_destination, headers)
        end

        def convert_yaml_to_csv(yml_file, path_to_destination, headers)
            CSV.open(path_to_destination, "wb") do |csv|
              csv << headers
              yml_file.each do |data|
                row = []
                headers.each { |header| data[header] ? row << data[header] : row << nil }
                csv << row
              end
            end
        end    
    end
end

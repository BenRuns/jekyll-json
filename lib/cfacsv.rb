require 'yaml'
require 'csv'
require 'jekyll'



module Jekyll

    class MakeCsvProjectFile < Generator

        safe true

        def generate(site)
            
            data_files = YAML.load_file(File.join(site.source, '_data/projects.yml'))
            header = %w[name description link_url code_url type categories status]

            CSV.open(File.join(site.source,"projects/projects.csv"), "wb") do |csv|
              csv << header
              data_files.each do |data|
                row = []
                header.each { |header| data[header] ? row << data[header] : row << nil }
                csv << row
              end
            end
        end
    end
end

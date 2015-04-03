require 'yaml'
require 'csv'



# class MakeCsvProjectFile < Jekyll::Command
#   class << self


#     def init_with_program(prog)
#       prog.command(:build) do |c|
#         c.syntax "build [options]"
#         c.description 'generate csv file for code for america from _data/projects.yml'
#         c.action do |args, options|
#             data_files = YAML.load_file('./_data/projects.yml')
#             header = %w[name description link_url code_url type categories status]

#             CSV.open("./projects/projects.csv", "wb") do |csv|
#               csv << header
#               data_files.each do |data|
#                 row = []
#                 header.each { |header| data[header] ? row << data[header] : row << nil }
#                 csv << row
#               end
#             end
#         end
#       end
#     end
#   end
# end
class MyNewCommand < Jekyll::Command
  class << self
    def init_with_program(prog)
      prog.command(:sayhello) do |c|
        c.syntax "sayhello [options]"
        c.description 'Create a new Jekyll site.'
        c.option 'dest', '-d DEST', 'Where the site should go.'

        c.action do |args, options|
          puts "Hello World"
        end
      end
    end
  end
end
### Code For America to CSV
## cfacsv gem

This gem is created to be used with jekyll webpages.It does one thing. On page build, it converts the _data/projects.yml file into the csv file in the format the Code for America requested and places it in projects/projects.csv

It's rather fragile code at the moment and I welcome anyone that would like to help me write tests and increase it's usability etc before publishing it to rubygems.

## Installing 
add the following to your gem file in jekyll

    group :jekyll_plugins do
      gem 'cfacsv', :git => 'git://github.com/BenRuns/cfacsv.git', :branch => 'master'
    end

make sure that you're using the following headers in the yaml file

`name description link_url code_url type categories status`

run `jekyll build` 

that's it



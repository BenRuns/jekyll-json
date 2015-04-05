#Jekyll-Json  
[![Gem Version](https://badge.fury.io/rb/jekyll-json.svg)](http://badge.fury.io/rb/jekyll-json)

This gem is created to be used with jekyll webpages. It will take a yaml file and build an index.csv file an index.json file in the folder that you specify in _config.yml 

## Installing 


Add the following to your gemfile

```
group :jekyll_plugins do
  gem 'jekyll-json'
end
```
In your `_config.yml` add

```
gems:
- jekyll-json
```

and something like the following

```
serve-json-csv:
  - destination: "foldername"
    origin: "_path_from_root/to_your_data.yml"
    csv: true
    json: true
    headers: [name, description, link_url, code_url, type, categories, status]
    filter-json: true
```

The headers are required if you're creating a csv file or if you set filter-json to true

For example:
Given a yml file that looks like

```
- name: "Jack"
  country: "Australia"
  etc: "likes cake"
  pail: "empty"
  
- name: "Jill"
  country: "Oz"
  etc: "likes ice cream"
  pail: "full"
  
```
and set the headers to:
`[name,country, etc]`

This will produce an index.csv file

```
name, country, etc
Jack, Australia, likes cake
Jill, Oz,likes ice cream
```
if `filter-json` is set to `true`, then it will produce an index.json file 

```
[{
    name: "Jack",
    country: "Australia",
    etc: "likes cake"
},
{
    name: "Jill",
    country: "Oz",
    etc: "likes ice cream"
}]
```
set csv and json to true or false depending on whether you want the file generated.


run `jekyll build` to generate the files
### Contributing.

Let me know if there are issue's you're running into . This is a first release and there is still plenty of work to put in to make this less fragile.
Fork the repo, make a pull request etc...



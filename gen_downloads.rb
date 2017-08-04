#!/usr/bin/ruby -w

require "yaml"

downloads = YAML.load_file("downloads.yml").sort_by { |download| download["date"] }.reverse

puts <<EOF
## Bocfel Downloads

The source code for Bocfel is provided here.

Latest version: #{downloads.first["version"]}
EOF

downloads.each do |download|
  puts <<EOF

### Bocfel #{download["version"]}

[bocfel-#{download["version"]}.tar.gz](downloads/bocfel-#{download["version"]}.tar.gz?raw=true)

Release date: #{download["date"]}

Release notes:
EOF

  puts download["release_notes"].map { |note| "* #{note} " }.join("\n")
end

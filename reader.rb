require 'smarter_csv'
require 'awesome_print'
require 'yaml'

Dir.glob('csv/*.csv').each do |csv|
  puts csv
  chunk = SmarterCSV.process(csv)
  chunk.each do |data|
    if data.keys.count != 4
      ap "UGH bad data #{data}" # to be reviewed by hand
    end
  end
  puts chunk.size
  hash = SmarterCSV.process(csv)
  pretty_yaml = hash.to_yaml.gsub("\n-", "\n-\n ").gsub(/:(\w+):/, "\\1:")
  filename = 'data/' + csv.split('/').last.sub(/\.csv/, '.yml')
  File.write(filename, pretty_yaml)
end

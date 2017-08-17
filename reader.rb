require 'smarter_csv'
require 'awesome_print'

Dir.glob('csv/*.csv').each do |csv|
  puts csv
  chunk = SmarterCSV.process(csv)
  chunk.each do |data|
    if data.keys.count != 4
      ap "UGH bad data #{data}"
    end
  end
  puts chunk.size
end

require 'smarter_csv'

Dir.glob('csv/*.csv').each do |csv|
  puts csv
  SmarterCSV.process(csv)
end

require 'pdf-reader'
require 'awesome_print'

reader = PDF::Reader.new('whoseheritage_splc.pdf')

i = 0

reader.pages.each do |page|
  i += 1
  next unless i == 19 # the good stuff
  page.text.lines.each do |line|
    lines = line.scan(/.{1,89}/)
    lines = lines.map do |line|
      line.to_s.gsub(/([a-z])([A-Z])/, "\\1 \\2")
    end.flatten.flatten
    ap lines
  end
end

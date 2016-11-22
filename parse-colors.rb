require 'nokogiri'
require 'pp'

doc = Nokogiri::HTML(File.read('colors.html'))
input = ARGV[0];

colors = {}
list = doc.xpath('//li')
list.each do |li|
  name = li.xpath('div/div/div/p').text.downcase.gsub(' ', '-')
  code = li.xpath('div/div/div/h4').text.to_i
  style = li.attributes['style'].text
  match = style.match('^background-color: (.*?);')
  color_code = match[1]
  colors[name] = { code: code, color_code: color_code }
end

colors.sort do |a, b|
  a[1][:code] <=> b[1][:code]
end.each do |k, v|
  if input == 'css'
    puts "\.c#{v[:code]}-#{k} { background-color: #{v[:color_code]}; }"
  else
    puts "\"#{v[:code]}-#{k}\","
  end
end

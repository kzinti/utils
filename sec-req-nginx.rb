require 'ruport'

myArray = Array.new
File.open('access.log.from.api2', 'r') do |f|
  while (line = f.gets)
    /(\d+) \d+/.match(line)
    myArray << $1.to_i
  end
end

myHash = Hash.new(0)# do |h, k|
#  h[k] = Hash.new(0)
#end

myArray.each do |a|
  case a.to_i
  when 0..20
    myHash["000-200"] += 1
  when 20..30
    myHash["200-300"] += 1
  when 30..40
    myHash["300-400"] += 1
  when 40..50
    myHash["400-500"] += 1
  when 50..60
    myHash["500-600"] += 1
  when 60..70
    myHash["600-700"] += 1
  when 70..80
    myHash["700-800"] += 1
  else
    myHash["800-***"] += 1
  end

end

num =  myHash["000-200"].to_i + myHash["200-300"].to_i +
       myHash["300_400"].to_i + myHash["400-500"].to_i +
       myHash["500_600"].to_i + myHash["600-700"].to_i +
       myHash["700-800"].to_i + myHash["800-***"].to_i
num /= 100

myHash["000-200"] = (Float(myHash["000-200"])/Float(num)).round(2)
myHash["200-300"] = (Float(myHash["200-300"])/Float(num)).round(2)
myHash["300-400"] = (Float(myHash["300-400"])/Float(num)).round(2)
myHash["400-500"] = (Float(myHash["400-500"])/Float(num)).round(2)
myHash["500-600"] = (Float(myHash["500-600"])/Float(num)).round(2)
myHash["600-700"] = (Float(myHash["600-700"])/Float(num)).round(2)
myHash["700-800"] = (Float(myHash["700-800"])/Float(num)).round(2)
myHash["800-***"] = (Float(myHash["800-***"])/Float(num)).round(2)

report = Table(:column_names => ['000-200', '200-300', '300-400', '400-500',
                                 '500-600', '600-700', '700-800', '800-***'])
report << myHash

puts report.to_s

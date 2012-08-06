require 'ruport'

my_hash = Hash.new(0)
File.open('access.log', 'r') do |f|
  while(line = f.gets)
    /\[(\d+)\/Jul\/\d+\:(\d+)/.match(line)
    if($1 == "28")
      my_hash[$2] += 1
    end
  end
end

#binding.pry

total = 0

my_hash.each do |k, v|
  total += v
end

puts "Total: " + total.to_s

total /= 100

#report = Table(:column_names => ['hour', 'number of requests'])

my_hash.each do |k, v|
  ##puts (Float(v)/Float(total)).round(2)
  print k + ":  "
  puts  v
  #report << my_hash[k].merge({'hour' => k})
end

#puts report.to_s

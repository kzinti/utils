myArray = Array.new
File.open('rubyClassFile', 'r') do |f|
  while (line = f.gets)
    #/\[(\d+).*:(\d+):(\d+):(\d+) (\d+)/
    /\[(\d+).*:(\d+):(\d+):(\d+)/.match(line)
    myArray << [$1, $2, $3, $4]
  end
end

myHash = Hash.new(0)

myArray.each do |a|
  myHash[a] += 1
end

hold = 0

myHash.each do |k, v|
  if v > hold
    hold = v
  end
end

puts hold
#puts counter
#  if a[0].to_i == 11 && a[1].to_i == 8
#    print a[2], a[3], "\n"
#  end
#case a[1].to_i
#  when 17
#    counter[0] += 1
#  when 18
#    counter[1] += 1
#  when 19
#    counter[2] += 1
#  when 20
#    counter[3] += 1
#  when 21
#    counter[4] += 1
#  end
#  if day != a[0].to_i
#    print day = a[0]
#  end
#end
#day.each do |a|
#  puts (a.length/24)/(60)/(60)
#end
#counter.each do |c|
#  puts (Float(c)/7)/(60)/(60)
#end

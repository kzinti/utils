require 'ruport'

myArray = Array.new
File.open('rubyClassFile', 'r') do |f|
  while (line = f.gets)
    #/\[(\d+).*:(\d+):(\d+):(\d+) (\d+)/
    /\[(\d+).*:(\d+):(\d+):(\d+) (\d+)/.match(line)
    myArray << [$1, $5]#2, $3, $4]
  end
end

myHash = Hash.new do |h, k|
  h[k] = Hash.new(0)
end

myArray.each do |a|
  case a[1].to_i
  when 0..200000
    myHash[a[0]]["000-200"] += 1
  when 200000..300000
    myHash[a[0]]["200-300"] += 1
  when 300000..400000
    myHash[a[0]]["300-400"] += 1
  when 400000..500000
    myHash[a[0]]["400-500"] += 1
  when 500000..600000
    myHash[a[0]]["500-600"] += 1
  when 600000..700000
    myHash[a[0]]["600-700"] += 1
  when 700000..800000
    myHash[a[0]]["700-800"] += 1
  else
    myHash[a[0]]["800-***"] += 1
  end
end

report = Table(:column_names => [ 'day', '000-200', '200-300', '300-400', '400-500',
                                         '500-600', '600-700', '700-800', '800-***'])

myHash.each do |k, v|
  num = v["000-200"].to_i + v["200-300"].to_i +
        v["300-400"].to_i + v["400-500"].to_i +
        v["500-600"].to_i + v["600-700"].to_i +
        v["700-800"].to_i + v["800-***"].to_i
  num /= 100
  v["000-200"] = (Float(v["000-200"].to_i)/Float(num)).round(2)
  v["200-300"] = (Float(v["200-300"].to_i)/Float(num)).round(2)
  v["300-400"] = (Float(v["300-400"].to_i)/Float(num)).round(2)
  v["400-500"] = (Float(v["400-500"].to_i)/Float(num)).round(2)
  v["500-600"] = (Float(v["500-600"].to_i)/Float(num)).round(2)
  v["600-700"] = (Float(v["600-700"].to_i)/Float(num)).round(2)
  v["700-800"] = (Float(v["700-800"].to_i)/Float(num)).round(2)
  v["800-***"] = (Float(v["800-***"].to_i)/Float(num)).round(2)

  report << myHash[k].merge({'day' => k})
end

puts report.to_s

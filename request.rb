#!/home/justinb/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

parser = LogParser.new

current_key = 0
count = 0

while STDIN.gets
  line = $_

  parsed_data = parser.parse_line(line)  

  parsed_data[:datetime] =~ %r{(\d{2})/(\w{3})/(\d{4}):(\d{2}):(\d{2})}
  day, month, year, hour, minute = $1, $2, $3, $4, $5

  key = Time.mktime(year, month, day, hour, minute, 0).to_i

  if key != current_key

    if count > 0
      #timestamp, request/minute, requests/second
      printf "%d %d %d\n", key, count, count/60
    end

    count = 0
    current_key = key
  end

  count = count + 1
end

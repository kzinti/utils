def myFunc
  (1..ARGV[0].to_i).each do
     output = system("wget --header='accept-encoding: gzip' -O /dev/null " << ARGV[2]) #http://192.168.1.31/uh_epub/uh)
     puts output
  end
end

threads = []

(1..ARGV[1].to_i).each do |t|
  threads << Thread.new{myFunc()}
end

threads.each { |t|  t.join }

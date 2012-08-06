myarray = Array.new
File.open('pgAdminOutput', 'r') do |f|
  while (line = f.gets)
    myarray.push line.chomp
  end
end
File.open('random_replay_log', 'w') do |f|
  (1..1000).each do |x|
    f.print "/classified/" + myarray[x].to_s +  "\0"
  end
end

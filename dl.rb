require 'fileutils'
File.open('output.txt', 'w') {}
f = File.open('list.txt').to_a

f.each do |a|
	system( "youtube-dl -k --extract-audio --audio-format mp3 #{a}" )
	system( "rm *.mp4" )
	system( "rm *.flv" )
	system( "mv *.mp3 process/" )
end
files = Dir.glob("process/*")
system( "mv -v process/*.mp3 ~/Music/iTunes/iTunes\\ Media/Automatically\\ Add\\ to\\ iTunes.localized" )
files.each do |fn|
  folder = "process/"
  file = fn[folder.length..fn.length-5]
  puts "#{file}"
  File.open('output.txt', 'w') {}
  output = File.open('output.txt').to_a
  str = output[0].to_s
  until str.include? "class"
    File.open('output.txt', 'w') {}
    system( "osascript add_track_to_talks.scpt '#{file}' > output.txt" )
    output = File.open('output.txt').to_a
    str = output[0].to_s
    sleep(1)
  end
end
system( "osascript sync.scpt")

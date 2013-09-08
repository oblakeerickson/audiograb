require 'fileutils'

f = File.open('list.txt').to_a
f.each do |a|
	system( "youtube-dl -k --extract-audio --audio-format mp3 #{a}" )
	system( "rm *.mp4" )
	system( "rm *.flv" )
	system( "mv *.mp3 process/" )
  system( "mv process/*.mp3 ~/Music/iTunes/iTunes\\ Media/Automatically\\ Add\\ to\\ iTunes.localized" )
end
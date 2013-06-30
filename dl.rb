f = File.open('list.txt').to_a
f.each do |a|
	system( "youtube-dl -k --extract-audio --audio-format mp3 #{a}" )
end
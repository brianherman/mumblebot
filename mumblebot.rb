require 'mumble-ruby'
require 'nokogiri'
require 'net/http'
$cli = Mumble::Client.new('brianherman.dyndns.tv', 64738, 'MumbleBot')

#$cli = Mumble::Client.new('mumble.nerd.nu',6162 , 'MumbleBot')
$cli.on_text_message do |msg| 
    case msg.message.chomp
    	when /lookup/
		Net::HTTP.start( 'www.mcbouncer.com', 80 ) do |http|
			lookup = msg.message.slice(7,msg.message.length)
			puts lookup
		 	body = http.get( '/user/'+lookup+'/bansFor' ).body 
	  	 	doc = Nokogiri::HTML(body)
		 	doc.css('#json-table td').each do |link|
			puts link
				$cli.text_user($cli.users[msg.actor].name,link.content);
			puts link.content.length
		 end

		 #puts body
		 puts $cli.users[msg.actor]
	end
    	when /notes/
		Net::HTTP.start( 'www.mcbouncer.com', 80 ) do |http|
			lookup = msg.message.slice(6,msg.message.length)
			puts lookup
		 	body = http.get( '/user/'+lookup+'/notesFor' ).body 
	  	 	doc = Nokogiri::HTML(body)
		 	doc.css('#json-table td').each do |link|
			puts link
				$cli.text_user($cli.users[msg.actor].name,link.content);
			puts link.content.length
		 end

		 #puts body
		 puts $cli.users[msg.actor]
	end
    	when /notesmade/
		Net::HTTP.start( 'www.mcbouncer.com', 80 ) do |http|
			lookup = msg.message.slice(10,msg.message.length)
			puts lookup
		 	body = http.get( '/user/'+lookup+'/notesBy' ).body 
	  	 	doc = Nokogiri::HTML(body)
		 	doc.css('#json-table td').each do |link|
			puts link
				$cli.text_user($cli.users[msg.actor].name,link.content);
			puts link.content.length
		 end

		 #puts body
		 puts $cli.users[msg.actor]
	end
    	when /ipbans/
		Net::HTTP.start( 'www.mcbouncer.com', 80 ) do |http|
			lookup = msg.message.slice(7,msg.message.length)
			puts lookup
		 	body = http.get( '/user/'+lookup+'/ipBansBy' ).body 
	  	 	doc = Nokogiri::HTML(body)
		 	doc.css('#json-table td').each do |link|
			puts link
				$cli.text_user($cli.users[msg.actor].name,link.content);
			puts link.content.length
		 end

		 #puts body
		 puts $cli.users[msg.actor]
	end
    	when /bansBy/
		Net::HTTP.start( 'www.mcbouncer.com', 80 ) do |http|
			lookup = msg.message.slice(7,msg.message.length)
			puts lookup
		 	body = http.get( '/user/'+lookup+'/notesbansBy' ).body 
	  	 	doc = Nokogiri::HTML(body)
		 	doc.css('#json-table td').each do |link|
			puts link
				$cli.text_user($cli.users[msg.actor].name,link.content);
			puts link.content.length
		 end

		 #puts body
		 puts $cli.users[msg.actor]
	end
	when "disconnect"
		$cli.disconnect
	else
		puts msg.message
    end
end
$cli.connect
while true

end


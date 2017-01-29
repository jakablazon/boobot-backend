namespace :parse do
  
  require 'open-uri'
  require 'nokogiri'

  desc "Parse Tumblr"
  task tumblr: :environment do

  	sites = {
  		"tities" => "http://alldemtitties.tumblr.com/page/",
  		"asses" => "http://viksaas.tumblr.com/page/",
  		"cute" => "http://cutegirlnude.tumblr.com/page/",
  		"amateur" => "http://girlnextdooramateur4everybody.tumblr.com/page/",
  		"snapchat" => "http://bestnakedsnapgirls.tumblr.com/page/",
  		"hot" => "http://hot-sexgifs.tumblr.com/page/",
  		"pussy" => "http://dripping-wet-pussies.tumblr.com/page/",
  		"tight" => "http://sexytightpussy.tumblr.com/page/",
  		"anal" => "https://analsexonly.tumblr.com/page/",
  		"faces" => "http://facesofanal.tumblr.com/page/",
  		"orgasm" => "http://femorg.tumblr.com/page/",
  		"nudes" => "http://celebration-of-nudes.tumblr.com/page/"
  	}

  	sites.each do |key, item|
  		tag 	= key
  		
		(1..400).each do |page|
			
			doc 	= Nokogiri::HTML(open(item.to_s + page.to_s))
    		images 	= doc.css('.post a img')

    		break if images.length == 0

	    	images.each_with_index do |i, index|
	    		url = i["src"]
	    		
	    		case url.to_s.last(3)
					when "gif"
					  imageType = "gif"
					else
					  imageType = "image"
				end

	    		Item.create({
	    			itemType: "image",
	    			url: url
				})

				puts url
	    	end
    	end

	end

  end

  desc "Parse reddit"
  task reddit: :environment do
  end

  desc "Parse anyfap"
  task anyfap: :environment do
  end

end

class CommandController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => :boobot

  require 'open-uri'
  require 'nokogiri'
  require 'cgi'

  def boobot

    listOfRandomSearches = [
        'ass',
        'tits',
        'doggy',
        'naked',
        'cum',
        'blowjob',
        'sex',
        'creampie',
        'anal',
        'pussy',
        'eyes',
        'glasses',
        'slut',
        'bikini',
        'cutie',
        'finger',
        'milf',
        'buttsex',
        'hard',
        'spread',
        'threesome',
        'vibrator',
        'buttplug',
        'spanking'''
    ]

    #if params[:text].present?
      #query = params[:text]
      #text = "You searched for `" + query + "`"
    #else
      #query = listOfRandomSearches.sample
      #text = "We searched `" + query + "` for you "
    #end

    offset = rand(Item.count)
    randomRecord = Item.offset(offset).first

    text = ["Grab 'em by the pussy!' - D. Trump", "This pussy bites back"]



    # Build Command Response
    data = {
        "response_type" => "in_channel",
        "attachments" => [
            "color"       => "#36a64f",
            #"pretext"     => "Here, relax your eyes for a while.",
            "title"       => "Here, relax your eyes for a while.",
            "title_link"  => randomRecord.url,
            "text"        => text.sort_by { rand }.first,
            "image_url"   => randomRecord.url,
            "thumb_url"   => randomRecord.url,
            "ts"          => DateTime.now.strftime('%s'),
        ]
    }

    render :json => data
  end

end

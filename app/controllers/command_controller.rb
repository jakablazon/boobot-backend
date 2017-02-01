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

    text = [
      "Grab 'em by the pussy!' - D. Trump",
      "This pussy bites back"
    ]

    title = [
      "Here, relax your eyes for a while ",
      "Enjoy this little moment of yours",
      "Let this picture make a better day for you"
    ]

    randomUrl = randomRecord.url

    # Build Command Response
    data = {
        "response_type" => "in_channel",
        "attachments" => [
            "color"       => "#36a64f",
            #"pretext"     => "Here, relax your eyes for a while.",
            "title"       => title.sort_by {rand}.first,
            "title_link"  => randomUrl,
            "text"        => text.sort_by { rand }.first,
            "image_url"   => randomUrl,
            "thumb_url"   => randomUrl,
            "ts"          => DateTime.now.strftime('%s'),
        ]
    }

    render :json => data
  end

end

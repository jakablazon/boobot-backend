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

    if params[:text].present?
      query = params[:text]
      text = "You searched for `" + query + "`"
    else
      query = listOfRandomSearches.sample
      text = "We searched `" + query + "` for you "
    end

    # Encode Query String
    query = query.gsub(/[^0-9a-z ]/i, '')

    logger.info query

    # Get Number Of Pages By Search Query
    doc = Nokogiri::HTML(open("http://anyfap.com/" + query))
    pages = doc.css('.page-btn')

    # Get Random Page
    randomPage = rand(1..pages.length)

    # Open On That Random Page
    doc = Nokogiri::HTML(open("http://anyfap.com/" + query + "?images=true&videos=false&order=relevance&page=" + randomPage.to_s))

    # Get Number Of Results
    images = doc.css('.row .col-md-2')

    # Get Random Image
    randomImage = rand(1..images.length)

    # Get Random Image URL And Title
    mainImage = images.css('.thumb')[randomImage]['src']
    mainImageTitle = images.css('.title-grid p')[randomImage].text

    if mainImageTitle.empty? || mainImage.empty?
      abort("Shit hit the roof.")
    end

    # Build Command Response
    data = {
        "response_type" => "in_channel",
        "attachments" => [
            "color"       => "#36a64f",
            "pretext"     => "Here, relax your eyes for a while.",
            "title"       => mainImageTitle,
            "title_link"  => mainImage,
            "text"        => text,
            "image_url"   => mainImage,
            "thumb_url"   => mainImage,
            "ts"          => DateTime.now.strftime('%s'),
        ]
    }

    render :json => data
  end

end

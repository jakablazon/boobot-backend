class CommandController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :boobot

  def boobot

    data = {
        'attachments' => [
            "color"=> "#36a64f",
            "pretext"=> "Desired image",
            "title"=> "Test",
            "title_link"=> "https://api.slack.com/",
            "text"=> "You searched for: keyword",
            "image_url"=> "http://placehold.it/350x150",
            "thumb_url"=> "hhttp://placehold.it/100x100",
            "ts"=> DateTime.now.strftime('%s'),
        ]
    }

    render :json => data
  end

end

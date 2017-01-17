class CommandController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :boobot

  def boobot

    nakedGirls = [
        'http://c1.nuttit.com/Cache/GetImage?id=FoGJk4A.jpg',
        'http://c3.nuttit.com/Cache/GetImage?id=6VVXqgN.png',
        'http://c1.nuttit.com/Cache/GetImage?id=TmBCHmn.jpg',
        'http://c1.nuttit.com/Cache/GetImage?id=VxNH8Bi.jpg',
        'http://c1.nuttit.com/Cache/GetImage?id=gKjHmbT.jpg',
        'http://c2.nuttit.com/Cache/GetImage?id=MFPTO3Y.jpg',
        'http://c3.nuttit.com/Cache/GetImage?id=Jre99Xa.jpg',
        'https://68.media.tumblr.com/b6663bd10a3acae8b47e9a0072340689/tumblr_nfp5mqeQoE1u4z5uqo1_500.gif',
        'http://c2.nuttit.com/Cache/GetImage?id=Lj5tr6c.jpg',
        'http://c3.nuttit.com/Cache/GetImage?id=vso6IlX.png',
        'http://c1.nuttit.com/Cache/GetImage?id=5t4j2mU.png',
        'http://c3.nuttit.com/Cache/GetImage?id=hbrIgcx.gif'
    ]

    randomImage = nakedGirls.sample

    data = {
        'attachments' => [
            "color"=> "#36a64f",
            "pretext"=> "Desired image",
            "title"=> "Test",
            "title_link"=> "https://api.slack.com/",
            "text"=> "You searched for:",
            "image_url"=> randomImage,
            "thumb_url"=> randomImage,
            "ts"=> DateTime.now.strftime('%s'),
        ]
    }

    render :json => data
  end

end

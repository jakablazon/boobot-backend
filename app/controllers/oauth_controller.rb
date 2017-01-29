class OauthController < ApplicationController

  require 'rest-client'

  def redirect
    if !params[:code].present?
      render 'error'
    end

    accessToken = RestClient.post 'https://slack.com/api/oauth.access', {
        client_id:      ENV['SLACK_API_ID'],
        client_secret:  ENV['SLACK_API_SECRET'],
        code:           params[:code],
        redirect_uri:   request.base_url + redirect_path
    }

    @data = JSON.parse accessToken

    #Team.create({
    #  access_token: data.access_token,
    #  teamId: data.team_id,
    #  team_name: data.team_name,
    #  channel: data.incoming_webhook.channel,
    #  channelId: data.incoming_webhook.channel_id,

    #})

    render 'oauth/success'
  end

end

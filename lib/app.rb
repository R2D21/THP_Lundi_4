# coding: utf-8
require "gossip"

class GossipProjectApp < Sinatra::Base

  get '/gossips/new' do
    erb:new_gossips
  end
  post '/gossips/new' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end


  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get %r{/gossips/([\d]+)} do
     @id = params[:captures].first

end

class HomeController < ApplicationController
	@@client = Tumblr::Client.new :consumer_key => 'azMJTMHgd2spw9Jbw3LZNe9ZAH4L3zlBDzgemPYZCoqNK0v6aX'
	@@timestamp = 0
	@@tag = 'art'
  def index
  	if params[:search] == nil
  		@@tag = 'art'
  	else
  		@@tag = params[:search]
  	end
  	if @@timestamp == 0
  		result = @@client.tagged @@tag
  	else
  		result = @@client.tagged @@tag, :before => @@timestamp
  	end
  	posts = []
  	for post in result
  		if post["type"] == "photo"
  			posts.push(post["photos"])
  			if @@timestamp > post["timestamp"] or @@timestamp == 0
  				@@timestamp = post["timestamp"]
  			end
  		end
  	end
  	
  	p @@timestamp
  	@images = []
  	for photoset in posts
  		for photo in photoset
  			@images.push(photo["original_size"])
  		end
  	end
  	return @images
  end

end

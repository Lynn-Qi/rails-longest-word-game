require 'open-uri'
class GamesController < ApplicationController
  def new
    character = ('A'..'Z').to_a.sample(10)
    @letter = character.join(' ')  
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    json = open(url).read
    try_search = JSON.parse(json)
    inputs_arr = params[:word].upcase.chars
    inputs_arr.each do |e|
      p e
      if @letter.include?(e) == false
        @result = "Sorry, but Test can't be built out of #{inputs_arr.join(',')}"
      elsif !try_search[:found]
        @result = "Sorry, but #{params[:word]} does not seem to be a valid English word..."

      elsif try_search[:found]
        @result = "Congratulations!#{params[:word]} is a valid English word"
      end
    end
  end 
  
end

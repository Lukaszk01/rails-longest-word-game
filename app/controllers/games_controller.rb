require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
     @letters = (0...5).map { (65 + rand(26)).chr }.join
  end
  def score


    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    user_serialized = open(url).read
    word = JSON.parse(user_serialized)
    @letters = params[:letters].split(" ")
    @found = "#{user["found"]}"
    @word = params[:word]
    @included = @word.upcase.chars.all? { |letters| @letters.include?(letter) }

    # if word == @letters
    #   return "congratulations #{prams[:word]} is valid english word!"
    # elsif word != @letters
    #   return "Sorry #{params[:word]} does not seems to be valid english perams[:word].."
    # else
    #   return "Sorry #{params[:word]} can't be build out of #{params[:letters]} "
    # end
  end
end

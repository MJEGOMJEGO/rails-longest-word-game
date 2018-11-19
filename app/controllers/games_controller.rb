class GamesController < ApplicationController
  def new
    @letters = []
    10.times do |random|
    random = ('a'..'z').to_a.sample
    @letters << random
    end
  end
require 'open-uri'
require 'json'


  def score
    @player_input = params[:player_input]

    serialisez_heroku = open("https://wagon-dictionary.herokuapp.com/#{@player_input}").read
    @heroku_hash = JSON.parse(serialisez_heroku)

    all_letters = []
    all_letters = @player_input.to_s.split(//)
    @letters = params[:letters].split


    if all_letters.all?{|z| all_letters.count(z) <= @letters.count(z)} == false
      @answer = "Sorry, but #{@player_input} can't be built out of #{@letters}"
    elsif @heroku_hash["found"] == true
      @answer = "Congratuations ! #{@player_input} is a valid English word"
    else
      @answer = "Sorry but #{@player_input} does not sees to be a valid English word"
    end
  end
end

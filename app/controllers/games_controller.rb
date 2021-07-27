require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    word = params[:word]
    @letters = params[:letters].split
    dictionary = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read)
    @result = 0
    @score = session[:score].to_i || 0
    if word.upcase.chars.all? { |x| word.upcase.chars.count(x) <= @letters.count(x) }
      if dictionary['found']
        @result = 1 # Congrats
        @score += word.chars.count ** 2;
        session[:score] = @score
      else
        @result = 2 # Not an English word
      end
    else
      @result = 0 # Not in the grid
    end
  end
end

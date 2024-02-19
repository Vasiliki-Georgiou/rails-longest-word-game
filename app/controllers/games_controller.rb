require "open-uri"

class GamesController < ApplicationController

  before_action :new

  def home
  end

  def new
    @letters = ('a'..'z').to_a
    @random_letters = @letters.sample(10);
  end

  def score
    @letters = params[:letters]
    @word_submitted = params[:games]
    url = "https://wagon-dictionary.herokuapp.com/#{@word_submitted}"
    @word = JSON.parse(URI.open(url).read)
    @parsed_letters = @word_submitted.chars
    @included = included?(@parsed_letters, @letters)
  end

  def included?(word, letters)
    word.any? {|letter| letters.include?(letter) }
  end
end

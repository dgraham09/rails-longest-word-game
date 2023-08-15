class GamesController < ApplicationController
  def new
    @letters = ('A'...'Z').to_a.sample(10)
  end
  def score
    word = params[:word]
    letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_serialized = URI.open(url).read
    word_result = JSON.parse(word_serialized)
    if word_result["found"] == true
      if word.split("").all? { |letter| letters.include?(letter)}
        puts "Yes"
      else
        puts "No"
      end
      @result = "Congratulations! #{word} is a valid English word"
    else
      @result = "This word is invalid"
    end
  end
end

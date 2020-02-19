require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'


class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    my_text = TextAnalyzer.new(text_from_user)
    @word_count = my_text.count_of_words
    @vowels_count = my_text.count_of_vowels
    @consonants_count = my_text.count_of_consonants
    hash1 = my_text.most_used_letter
    hash1.each do |key, value| 
          @letter = key.upcase
          @times = value
    end
    erb :results
  end
end

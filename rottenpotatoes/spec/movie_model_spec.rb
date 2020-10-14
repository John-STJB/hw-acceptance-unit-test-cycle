require 'rails_helper'

describe Movie do
  
  context 'other movies by that director' do
    it 'finds movies with same director' do
      @movie_1 = Movie.create(:id => "2020", title: "Spring1", director: "Director")
      @movie_2 = Movie.create(:id => "2021", title: "Summer2", director: "Director")
      results = Movie.similar_movies(@movie_1.id)
      expect(results).to eq([@movie_1,@movie_2])
    end        
  end    

  context 'no other movies by that director' do
    it 'finds no other movies with same director' do
      @movie_1 = Movie.create(:id => "2025", title: "Spring1", director: "Director")
      @movie_2 = Movie.create(:id => "2026", title: "Summer2", director: "Director1")
      results = Movie.similar_movies(@movie_1.id)
      expect(results).not_to eq([@movie_1,@movie_2])
    end
  end
end 
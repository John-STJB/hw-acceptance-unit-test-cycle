require 'rails_helper'

describe MoviesController, type: 'controller' do
    #let(:movies) { ['star wars', 'raiders'] }    
    
    #Defined at config/routes.rb
    context '#search_directors' do
      describe 'movie has a director' do
        
        it 'responds to the search_directors route' do
        
          @movie = Movie.create(:id => "2020", title: "Marvel", director: "John")
          get :search_directors, { id: 2020 }
          end
        end 

      describe 'search similar movies' do
        it 'queries the Movie model about similar movies' do
          # YOUR TEST CODE HERE
          @movie_1 = Movie.create(:id => "2024", title: "Marvel", director: "John")
          get :search_directors, id: @movie_1[:id]
          expect(response).to redirect_to(movies_path)
          #fail
        end
        
        it 'assigns similar movies to the template' do
          @movie_2 = Movie.create(:id => "2025", title: "Spiderman", director: "John")
          @movie_3 = Movie.create(:id => "2026", title: "Ironman", director: "John")
          get :search_directors, id:@movie_2[:id]
          expect(Movie.where(:director => @movie_2.director).size).to eq(2)
          
        end
      end
      
    end
  end
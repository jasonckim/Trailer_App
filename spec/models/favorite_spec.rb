require 'spec_helper'

describe Favorite do

  describe 'movie_id' do

    it 'should not be empty' do
      favorite = Favorite.create(user_id: 1, rating: 5, comment: 'cool')
      favorite.should_not be_valid
    end
  end

  describe 'user_id' do

    it 'should not be empty' do
      favorite = Favorite.create(movie_id: 1, rating: 4, comment: 'fun')
      favorite.should_not be_valid
    end
  end
end

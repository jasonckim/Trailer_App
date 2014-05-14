require 'spec_helper'

describe Movie do

  describe 'title' do
    it 'should not be empty' do
      movie = Movie.create(imdbID: '12341')
      movie.should_not be_valid
    end
  end

  describe 'imdbID' do
    it 'should not be empty' do
      movie = Movie.create(title: 'Star Wars')
      movie.should_not be_valid
    end
  end
end

require 'spec_helper'

describe User do

  describe 'email' do
    it 'should not be empty' do
      user1 = User.create(display_name: "Mark", password: "password", password_confirmation: "password")
      user1.should_not be_valid
    end

    it 'should have a valid format' do
      user1 = User.create(display_name: "Wally", email: "wally", password: "password", password_confirmation: "password")
      user1.should_not be_valid
    end

    it 'should be unique' do
      user = User.create(display_name: "jake", email: "fake@fake.com", password: "password", password_confirmation: "password")
      user2 = User.create(display_name: "name", email: "fake@fake.com", password: "password1", password_confirmation: "password1")
      user2.should_not be_valid
    end
  end
end


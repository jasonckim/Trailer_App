class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :imdbID
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end

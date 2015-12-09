class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.string :attachment

      t.timestamps null: false
    end
  end
end

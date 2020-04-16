class AddTopicReferenceToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :topic, null: false, foreign_key: true
  end
end

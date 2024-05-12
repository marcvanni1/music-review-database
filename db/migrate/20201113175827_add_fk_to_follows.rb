class AddFkToFollows < ActiveRecord::Migration[6.0]
  def change
    add_reference :follows, :follower, foreign_key: { to_table: :users }
    add_reference :follows, :following, foreign_key: { to_table: :users }
  end
end

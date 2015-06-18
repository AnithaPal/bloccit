class AddUserToSummaries < ActiveRecord::Migration
  def change
    add_reference :summaries, :user, index: true, foreign_key: true
  end
end

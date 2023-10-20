class AddGithubToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :github_uid, :string
    add_column :users, :github_token, :text
    add_column :users, :github_username, :string
  end
end

class AddOmniauthToClients < ActiveRecord::Migration
  def change
    add_column :clients, :name, :string
    add_column :clients, :provider, :string
    add_column :clients, :uid, :string
  end
end

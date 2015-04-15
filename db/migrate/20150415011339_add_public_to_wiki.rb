class AddPublicToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :public, :boolean
  end
end

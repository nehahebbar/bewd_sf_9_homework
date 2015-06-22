class AddDetailsToRecordlabels < ActiveRecord::Migration
  def change
    add_column :recordlabels, :name, :string
    add_column :recordlabels, :owner, :string
    add_column :recordlabels, :description, :text
  end
end

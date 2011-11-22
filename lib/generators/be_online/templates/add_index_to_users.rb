class AddIndexTo<%= file_name.pluralize.capitalize %> < ActiveRecord::Migration
  def change
    add_column :<%= file_name.pluralize %>, :session, :unique => true
  end
end
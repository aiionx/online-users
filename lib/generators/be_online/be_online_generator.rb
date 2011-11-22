class BeOnlineGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, :type => :string, :default => "user"
  
  def generate_be_online
    template "add_index_to_users.rb", "db/migrate/_add_index_to_#{file_name.pluralize.gsub('/', '_')}.rb"  
  end
  
  private  
    def file_name  
      model_name.underscore
    end
  
end

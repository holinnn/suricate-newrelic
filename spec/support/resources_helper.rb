module ResourcesHelper
  def resources_directory
    current_directory = File.dirname(__FILE__)
    File.join(current_directory, '..', 'resources')
  end

  def resource_path(path)
    File.join(resources_directory, path)
  end
end

module URLForHelper
  def url_for(path)
    FacultyAPI.base_url.merge(path).to_s
  end
end

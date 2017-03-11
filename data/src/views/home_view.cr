class HomeView < Tremolite::Views::BaseView
  def initialize(@blog : Tremolite::Blog, @url = "/")
  end

  getter :url

  def title
    @blog.data_manager.not_nil!["site.title"]
  end

  def output
    return "<h1>Hello</h1>"
  end

end

require "./views/home_view"

class Tremolite::Renderer
  def render_all
    render_index
  end

  def render_index
    view = HomeView.new(blog: @blog, url: "/")
    write_output(view)
  end
end

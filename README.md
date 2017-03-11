# tremolite_example

This is example static page created by [`tremolite`](https://github.com/akwiatkowski/tremolite)

## Step by step

1. Create empty Crystal project:

`crystal init app tremolite_example`

2. Add [`tremolite`](https://github.com/akwiatkowski/tremolite) shard to `shard.yml`:

```yaml
dependencies:
  tremolite:
    github: akwiatkowski/tremolite
```

3. Create `/data` directory:

`mkdir data`

4. Create `/data/config.yml` file with default data:

```yaml
site.title: Tremolite Example
site.desc: "An example static page created by tremolite engine"
site.email: hello@example.com
site.url: "https://github.com/akwiatkowski/tremolite"
site.author: Aleksander Kwiatkowski
```

5. Create `/data/assets` and `/data/images` directory.

`mkdir data/assets`
`mkdir data/images`

6. Prepare to override `Tremolite::Renderer#render_all`:

  * Create `/data/src/renderer.cr` file
  * Create `/data/src/blog.cr` and include renderer `require "./renderer"`

7. Override `Tremolite::Renderer#render_all`:

  ```crystal
  class Tremolite::Renderer
    def render_all
      render_index
    end

    def render_index
      view = HomeView.new(blog: @blog, url: "/")
      write_output(view)
    end
  end
  ```

8. Create `HomeView`:

  ```crystal
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
  ```

  Don't forget to require it `require "./views/home_view"` in `/data/src/renderer.cr`.

9. Run as explained below :)

## Usage

`shards build tremolite_example`
`./bin/tremolite_example`

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/akwiatkowski/tremolite_example/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [akwiatkowski](https://github.com/akwiatkowski) Aleksander Kwiatkowski - creator, maintainer

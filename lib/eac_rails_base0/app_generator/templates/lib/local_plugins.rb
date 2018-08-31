# frozen_string_literal: true

class LocalPlugins
  def self.rails_root
    File.expand_path('..', __dir__)
  end

  def self.plugins_roots
    [File.expand_path('vendor/gems', rails_root), File.expand_path('engines', rails_root)]
  end

  def self.plugins
    r = []
    plugins_roots.each do |root|
      Dir.glob("#{root}/*/").each do |plugin_dir|
        next unless File.directory?(plugin_dir)
        next unless Dir.entries(plugin_dir).any? { |f| f.match(/\.gemspec/) }
        r << LocalPlugin.new(plugin_dir)
      end
    end
    r
  end

  def self.app
    LocalPlugin.new(rails_root)
  end

  def self.app_and_plugins
    plugins + [app]
  end
end

class LocalPlugin
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def bundle
    bin_bundle = File.expand_path('bin/bundle', root)
    File.exist?(bin_bundle) ? 'bin/bundle' : 'bundle'
  end

  def subpath(path)
    File.expand_path(path, root)
  end

  def name
    app? ? 'APP' : File.basename(root)
  end

  def app?
    root == LocalPlugins.rails_root
  end

  def bundle_execute(args)
    Dir.chdir(root) { system(*([bundle] + args)) }
  end
end

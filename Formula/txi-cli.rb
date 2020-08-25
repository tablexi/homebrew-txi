class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'
  depends_on 'ruby'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    ENV['GEM_HOME']="#{prefix}"
    ENV['GEM_PATH']="#{prefix}"
    if defined?(HOMEBREW_SHIMS_PATH)
      ENV['PATH'] = ENV['PATH'].sub(HOMEBREW_SHIMS_PATH.to_s, '/usr/local/bin')
    end

    system "gem build txi-cli.gemspec"
    system "gem", "install", "txi-cli*.gem",
             "--no-document",
             "--no-wrapper",
             "--no-user-install",
             "--install-dir", prefix,
             "--bindir", bin

    # Don't install any bins
    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = Dir[File.expand_path(File.join(prefix, "gems", "#{name}-*"))].first
    gemspec = Gem::Specification::load("txi-cli.gemspec")
    ruby_libs = Dir.glob("#{prefix}/gems/*/lib")
    gemspec.executables.each do |exe|
      file = Pathname.new("#{brew_gem_prefix}/#{gemspec.bindir}/#{exe}")
      (bin+file.basename).open('w') do |f|
        f << <<-RUBY
#!/usr/bin/ruby --disable-gems
ENV['GEM_HOME']="#{prefix}"
ENV['GEM_PATH']="#{prefix}"
require 'rubygems'
$:.unshift(#{ruby_libs.map(&:inspect).join(",")})
load "#{file}"
        RUBY
      end
    end
  end
end

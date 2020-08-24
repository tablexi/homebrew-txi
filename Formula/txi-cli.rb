class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    ENV["GEM_HOME"] = libexec
    system "gem" "install" "bundler"
    system "bundle", "install", "--path", "vendor/bundle"
    bin.install "bin/txi"
    prefix.install "lib"
  end
end

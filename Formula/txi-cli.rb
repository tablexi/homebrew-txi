class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    # ENV['RBENV_ROOT'] = '/Users/derek/.rbenv'
    # system "rbenv local 2.7.1"
    # system "bundle install"
    bin.install "bin/txi"
    prefix.install "lib"
  end
end

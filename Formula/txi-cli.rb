class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    system "gem build txi-cli.gemspec"
    system "gem install txi-cli*.gem"
  end
end

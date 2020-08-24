class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'
  depends_on 'xcode'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    system "bundle install"
    bin.install "bin/txi"
    prefix.install "lib"
  end
end

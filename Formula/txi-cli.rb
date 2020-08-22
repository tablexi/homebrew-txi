class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    # system "bundle install --path vendor/bundle"
    bin.install "bin/txi"
    prefix.install "lib"
  end
end

class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, ref: :main

  def install
    bin.install 'txi'
  end
end

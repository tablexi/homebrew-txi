class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "https://github.com/tablexi/txi-cli.git"

  def install
    bin.install 'txi'
  end
end

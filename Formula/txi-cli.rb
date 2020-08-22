class TxiCli < Formula
  depends_on 'aws-cli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "https://github.com/tablexi/txi-cli.git"

  bin.install 'txi'
end

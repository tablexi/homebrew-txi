class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:eurydyce/MDANSE.git", using: :git

  def install
    bin.install 'txi'
  end
end

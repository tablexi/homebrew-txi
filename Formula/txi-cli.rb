class TxiCli < Formula
  depends_on 'awscli'
  depends_on 'docker'
  depends_on 'kubectl'

  head "git@github.com:tablexi/txi-cli.git", using: :git, branch: 'main'

  def install
    system "sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
    system "bundle install"
    bin.install "bin/txi"
    prefix.install "lib"
  end
end

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.2/solari-darwin-arm64"
      sha256 "97a44fed72326a914db4e93ca26749c22d5f0a9a09b3af1d7cabef89b9df49b6"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.2/solari-darwin-x64"
      sha256 "7b9c92ba84b0b9a48d2f7e14881515cc2f49b70812bd59a8e62551fd5def5ed8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.2/solari-linux-arm64"
      sha256 "5c3df58ce0be8a47bf754b6674a88be1c7f62704b8b8c948158d7f25c1c460df"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.2/solari-linux-x64"
      sha256 "81298a0b398f63bb286dfe6a937f4468ca4c5e378395a60197523659ce6cc778"
    end
  end

  def install
    downloaded = Dir["solari-*"].first
    odie "no solari binary in the staging directory" if downloaded.nil?
    bin.install downloaded => "solari"
  end

  def caveats
    <<~EOS
      Sign in before the first query:
        solari auth login
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/solari --version")
  end
end

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.11"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.11/solari-darwin-arm64"
      sha256 "55c242fbdd687f983cfcaa1cbb9ed698ac0c8d1aaf67cfc547ad9dc47ab24335"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.11/solari-darwin-x64"
      sha256 "159a68e87dc9efac07c168a51883bd08ff2f4d733a0fe32ce266e4cca400fb5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.11/solari-linux-arm64"
      sha256 "941c620ef61ee950685cca0c65c8b86fbfe47d19ae843645974b9bd5190bd25e"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.11/solari-linux-x64"
      sha256 "077400a23ad209623ef58957396e4740d492a8557a4e6c2182a98ba4e5d75517"
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

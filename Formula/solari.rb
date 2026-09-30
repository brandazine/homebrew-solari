class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.2.0/solari-darwin-arm64"
      sha256 "00fa5c1044e8e9ac54ce6cbb4dc27a0a47eb9fa66a7e990b12420e02e5c509c6"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.2.0/solari-darwin-x64"
      sha256 "9fd169ca63981c094b8e86dd93a7043e3b86f8de0454aad8f2598c53128f085e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.2.0/solari-linux-arm64"
      sha256 "41a1e1afb90976f4a47d393f2e6d9e4de5ee4b31bc6b31f517675299b75bc2d9"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.2.0/solari-linux-x64"
      sha256 "e3e8483552ecb820225d0d720eb89c5dc8d2255c502847154e06ede81a44554b"
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

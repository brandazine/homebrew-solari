class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.23"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.23/solari-darwin-arm64"
      sha256 "9c4be170eb7053c0f8d6d70d576a6aab3df20ab5d0ec807178a7481e7c20293a"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.23/solari-darwin-x64"
      sha256 "5edceb6f4c51c28090daf8a6b9e3247047937749c4534225df73702b3f42162b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.23/solari-linux-arm64"
      sha256 "35dcb190488fbc74a3add3779985d0fa6d46fae2e2bc6bbc040bb753faee0495"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.23/solari-linux-x64"
      sha256 "a4953934b6a9913164ee557e4380f0707c06df691929c29c01d7c1d6e1a2a7d0"
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

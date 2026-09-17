class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.20"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.20/solari-darwin-arm64"
      sha256 "56a8d903a0e2d45b6105c14556c9262e94848743d1e6d277c8cb61d839c5d7ad"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.20/solari-darwin-x64"
      sha256 "118965751a72fa7a8f31e3cd9bab07a061a142c4114e428a35979a9bdab45d94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.20/solari-linux-arm64"
      sha256 "5dfebb7986fd6b3307480ec7fe5a1bf33f64256e1c9c9f83a408cfad2031dc68"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.20/solari-linux-x64"
      sha256 "0dd92e3d463787926d741b87813277dbd89034456f98e8adbf4b0969142495bf"
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

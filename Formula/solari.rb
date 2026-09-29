class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.30"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.30/solari-darwin-arm64"
      sha256 "99d25a070707ebea41da7e3d19f26c3391a6b136fad4f377c195e93a721a9a8b"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.30/solari-darwin-x64"
      sha256 "e19dfefea59b5a923f6b7243e13a81a26e94a7ab1d378d7fe701747089e73ec1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.30/solari-linux-arm64"
      sha256 "d49d1b49909c6e6b6f3fb13dbb1b6ee63ffebd0899e6be34b60441bd73b083d6"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.30/solari-linux-x64"
      sha256 "09a338cd251c138d687d0abee7959f54a615aca98a66e519e87f2ce852d8bd4a"
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

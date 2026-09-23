class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.24"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.24/solari-darwin-arm64"
      sha256 "e2f38aa17029b7843e4fd480fa48d75cf9666192562130b0ba336fbd094a0a5c"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.24/solari-darwin-x64"
      sha256 "ea0bd0c5b0a96e06547c8a8d1c7e5596d6d99735c37310399b7d178541ec7e2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.24/solari-linux-arm64"
      sha256 "53b652eb1e0714fd25016c3040a9a5a043854d0dfda9fe6b6e4a58ff7b4daa76"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.24/solari-linux-x64"
      sha256 "30810876317a93e6ff389d4632524c7f79913fedc68e4fede85b68832d3091b4"
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

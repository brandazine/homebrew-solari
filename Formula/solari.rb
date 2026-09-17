class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.21"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.21/solari-darwin-arm64"
      sha256 "416cd9675c9ea4b2a4c53ff4e7de5b4686371a9027c3eaeeb241b49fdadbbf33"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.21/solari-darwin-x64"
      sha256 "74c353cc0810ea3d2e000c4d24cf0355a278fdb098abf86b8baf917d5589242e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.21/solari-linux-arm64"
      sha256 "16fb5d6b14877b3c85328285e533c5de4d23ecf28e40db8d29e04c06c18e3308"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.21/solari-linux-x64"
      sha256 "a5f6bd3c5d6112e33b63e3b389ba2c49ca3ced19cf0d81f4fd8a8ab47b069300"
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

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.3.0/solari-darwin-arm64"
      sha256 "45b2b12e4cf3a691ab3b1036496d4912f207abeeb0766bb8edef97db63c97902"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.3.0/solari-darwin-x64"
      sha256 "a488c9195349e7325d3cd6276b21a3a7c2523e62b2a4910926ae9e32a3e5d2d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.3.0/solari-linux-arm64"
      sha256 "9e815c42d27e2a9dda36428178825e58dc8bc60371959149b6080d63524b566e"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.3.0/solari-linux-x64"
      sha256 "5c9e4f8ba476bd77dc8de231bbd1620dc62f9141e8b68ce7bf9d0d5ce6965a00"
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

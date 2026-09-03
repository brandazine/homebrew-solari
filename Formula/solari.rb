class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.9/solari-darwin-arm64"
      sha256 "424de1c750438914f018e180f9943e898cd7b96bb40da41116110eefeef73a69"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.9/solari-darwin-x64"
      sha256 "2eb5616d5545fb49e6c425a4640d9b4140cf1b6c2e270fe46db7815c1c63c80d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.9/solari-linux-arm64"
      sha256 "c6226f8b95dbaf6c2f35dd95c69b77af6456411e682add48e9c8c1483ffe7aa5"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.9/solari-linux-x64"
      sha256 "2d5641b00ee0763ff18106527e88ff1fa69d28cdce6629f8cad5754be86f64ee"
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

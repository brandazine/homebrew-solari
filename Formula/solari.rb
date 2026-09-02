class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.7/solari-darwin-arm64"
      sha256 "494e09a3d52f6c117940d6bc32dae275cc63e73386ff33493125aeb5c586a11f"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.7/solari-darwin-x64"
      sha256 "b406e3682d2fddeb0923c7d1f619b07df535d387260c7f4ced976269c5846287"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.7/solari-linux-arm64"
      sha256 "02d7944a9a8153d3b1c43fd19cfe9cb27f66d751e3d1b7d1ba580772dca4106e"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.7/solari-linux-x64"
      sha256 "6002d2e477884d9b55422a73528318b1e653d425239d449bf7b53be6d2dae7bb"
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

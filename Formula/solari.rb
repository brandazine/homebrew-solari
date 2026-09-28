class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.27"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.27/solari-darwin-arm64"
      sha256 "92abe35013f789083390a266479dbe3bafcae67afe5b0107b7223d38584a8983"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.27/solari-darwin-x64"
      sha256 "348ded774fcd3961660e9333f87b5b34afbf4ff417025d5c1f4265f335f3c594"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.27/solari-linux-arm64"
      sha256 "5f076e9302c5f65d39b015dc506f04a3bd3d560d12a286af920e49daaa1c9b8f"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.27/solari-linux-x64"
      sha256 "2d8df88f6f4fac72d30c78b7f3124974ee68492fbde45afd2c515c2c07c38242"
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

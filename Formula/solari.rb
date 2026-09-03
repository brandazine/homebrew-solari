class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.10"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.10/solari-darwin-arm64"
      sha256 "9efd065877befa9bbcc5f9c84f5c28d121e943e081681cae375454b9d07e3ff0"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.10/solari-darwin-x64"
      sha256 "8a2346117299ff8505292e548012a381d8d962b66884aae7c1c728c95d3290c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.10/solari-linux-arm64"
      sha256 "8e68b2bb2dfcf3f9b71b22a57d46fa87354283c460a46a8ca14f33cdf58d8f59"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.10/solari-linux-x64"
      sha256 "849f1fb649a4e5b17f620ab80cd75f5a663a35435eacf777c3081dc67978899e"
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

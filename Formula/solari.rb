class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.1/solari-darwin-arm64"
      sha256 "41c5a94086009e4d8088c82a086a840a49505c6ae8a02227d89582a30191f806"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.1/solari-darwin-x64"
      sha256 "85a2b91406dfec9ebd8085abb730b0e51f387df3a9b0d141e0a7d397cd0ff3b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.1/solari-linux-arm64"
      sha256 "9e4bd5601791a39dcd1165ef2bc1eafb2c414489ab5199e259f79fb831f2f001"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.1/solari-linux-x64"
      sha256 "35c86357b8715dea24438a0037d36e3fa29889f92f8aedc90fdc910c2d5f51ea"
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

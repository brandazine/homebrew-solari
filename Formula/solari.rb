class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.2/solari-darwin-arm64"
      sha256 "c5c3a88d38403e04dab5ffc78f44b71acb49beb947a19f7ec1c4beef267b8baa"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.2/solari-darwin-x64"
      sha256 "0d6ec0d07fc75d19848c1a0a8932fe9ed6102674d063086c0a6633b0185f4e54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.2/solari-linux-arm64"
      sha256 "5d729d6a9379f95b627dad2351c23cdfe0b605005ac298a4dd1d9e4db2228866"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.2/solari-linux-x64"
      sha256 "86770350bb5ea393758104e66b474f93686d91c39c7098eebab94425fe2f13bb"
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

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.18"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.18/solari-darwin-arm64"
      sha256 "a0b4afc5e3012c0b49e1ddd2490f026f0fea4e80814a16924fb070bde6755a60"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.18/solari-darwin-x64"
      sha256 "cb641d484a9908f68d54eeff9c54a8fa710ed7e7c7d8896c3a94f67108963a76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.18/solari-linux-arm64"
      sha256 "23ab9717b397b7783feb0e34be4f3bd7b722479a9addb5bdfc1a50788db03006"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.18/solari-linux-x64"
      sha256 "c24d3141694fb8134e645739e15ad7862a076ab8efdbdfd028637b5b7afadee2"
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

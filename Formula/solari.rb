class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.2.1/solari-darwin-arm64"
      sha256 "8e0f8c3c6f0ba2680fdf8d967fa43f8d7ce774148d60824ac8f083437a3bc053"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.2.1/solari-darwin-x64"
      sha256 "8dbdf238e3a39506b73faea9441f242d376f8392634805c4c640d50ddf99eccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.2.1/solari-linux-arm64"
      sha256 "6547db9b243001d53b53269b7d77947b20c47cb8427a02a23cc20ab988350753"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.2.1/solari-linux-x64"
      sha256 "88727de4e350aa0f9e67b936a111b7bfce187b18e9884398e6ac94ec2d81bb72"
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

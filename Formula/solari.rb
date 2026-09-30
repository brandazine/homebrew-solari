class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.1.0/solari-darwin-arm64"
      sha256 "d1391f4e08fe866fb7d0e701e2f7e560dce01b690adc0c3b28572ee190ede5dc"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.1.0/solari-darwin-x64"
      sha256 "db7b8a6824c1252c38922567135d5168efc134da99a88102fd0a8a6b7f41adfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.1.0/solari-linux-arm64"
      sha256 "c3ba5f16ae3af5cac733ba13d4d48ec2d3af6e0e8065745dda9d98ade835785c"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.1.0/solari-linux-x64"
      sha256 "245987a24ea32a768d8bc555d5f7ccbd3be21e042482597c82a3486e9c1c0fbd"
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

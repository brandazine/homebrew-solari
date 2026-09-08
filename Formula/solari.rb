class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.17"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.17/solari-darwin-arm64"
      sha256 "2b771db17735c6456befd6c11eb148c7f9493c01ff2bd33915623892a36c9aa1"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.17/solari-darwin-x64"
      sha256 "3a5a06aa9582ebcd04ea3d903da24747d1e966d9692e4e5a904a44bb63b50928"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.17/solari-linux-arm64"
      sha256 "0b58e82c3fe825999772ca4d3b7865bb5527eca0ea3739e018822054f078faf0"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.17/solari-linux-x64"
      sha256 "a96c5d47eef0a060f484749ed860d67c637e6fdbb7da22e4a9b3101cf0f7959c"
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

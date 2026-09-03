class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.8/solari-darwin-arm64"
      sha256 "6228354b6266843dc8f53aa03cc2b3fe2227c860cc5c594e3dd658c565f6c050"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.8/solari-darwin-x64"
      sha256 "1fa62de631bc0fed2703d45ad8a48513a684685c3259d08b581d16784320546f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.8/solari-linux-arm64"
      sha256 "e06be08d193d5bc7bcb0cfeb51952e63e921a302d12525a6ff36bc159975aad6"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.8/solari-linux-x64"
      sha256 "4fdff7d25232764cdfd93c41abdff3f7c5d6e54b7debe1817b3cdcc5371f71a7"
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

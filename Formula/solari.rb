class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.19"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.19/solari-darwin-arm64"
      sha256 "f86e0e1af272e5b6e6d13938de18949da82b358db6d8da9e8030fa6f6884893d"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.19/solari-darwin-x64"
      sha256 "175a2eb787e67952672670707bd0f7ec69b3cb3eee23af6979fb8ad42a78f940"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.19/solari-linux-arm64"
      sha256 "7e34412bbfdd9089ba0991513342d3a8e3e81c16c3563b7fcb709bbced485aad"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.19/solari-linux-x64"
      sha256 "853735ab63d1ce465b9d23ca6b2b2ecc334c4111d8bcaac4927e7fb7c954f6ef"
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

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.14"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.14/solari-darwin-arm64"
      sha256 "bed6ed186f8689cf632fdb499c297c30622f20074c91828d952dd1f50c724968"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.14/solari-darwin-x64"
      sha256 "5dd9920edebc085f6fce011b8330857ee6a628156da620c6a99dc2b970054ae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.14/solari-linux-arm64"
      sha256 "02d49a9f37c05fb9bbda8853b9e4ee67606cd8de88e77bce12483525c7770d5c"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.14/solari-linux-x64"
      sha256 "acbdf3f23e6e3de8b8349568441f1f093545491a2d26fc68d211d46f796423b5"
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

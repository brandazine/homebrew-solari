class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.4/solari-darwin-arm64"
      sha256 "a2c7edad7a27cc15abaaf01efec4894a8ad7f45c5e8489a8936da91d03222502"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.4/solari-darwin-x64"
      sha256 "53304a639fbb00532b4570f6002c6e55ad061734bd30c8ba41b94dc3c45e03a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.4/solari-linux-arm64"
      sha256 "276310656294676a3b9b5bf8ab4fe009dda0ebca7e9419341b582074812f1148"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.4/solari-linux-x64"
      sha256 "b883c37dd319045601ffaa41bff03564e26042d4476c02470baa603b1c03dcfe"
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

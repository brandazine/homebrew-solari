class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.13"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.13/solari-darwin-arm64"
      sha256 "63ba19b858acb58bc5faf15645d5a39a26879c2528123d353d8d0974013306c9"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.13/solari-darwin-x64"
      sha256 "399eb2a92e11bd4085bf2c782b658fad3afa4dfa170787ecb58c3b8eeaf4cf07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.13/solari-linux-arm64"
      sha256 "03dc3e8ad2445871352cda90f2642c38ad35be17507e409fedda25c2708420d9"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.13/solari-linux-x64"
      sha256 "456a1bac229fe961e0ba6824b2cd826bd991f4ad7221f9de38f5ba10965072b3"
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

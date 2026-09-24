class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.26"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.26/solari-darwin-arm64"
      sha256 "c3c0c2a2367015c2f0264973dd623485559c26bf5b7d289f853daae60b0c4516"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.26/solari-darwin-x64"
      sha256 "d622bb8643ad43311e445033e6a3f1ef37cd01d34ee196ae842d6e0e07f8a6aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.26/solari-linux-arm64"
      sha256 "93948355f52adcf5cbbc6fe5638fa721db72beb3565d1afec008ae89e4d41ff1"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.26/solari-linux-x64"
      sha256 "b75d4adb09b509fef3b47678852a4c897dd594b51b3630df1739bc9e46ae0602"
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

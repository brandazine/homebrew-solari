class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.15"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.15/solari-darwin-arm64"
      sha256 "8be559265505552493612bb6b0951f612087319d5c0ec91c60f4b2912aa7386d"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.15/solari-darwin-x64"
      sha256 "401e2fa0ce7a25a706185873d3d14557fbf49eb89e2a53fcb8370c4adb1f1e11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.15/solari-linux-arm64"
      sha256 "754f2cf7dabfecdf960dcbefbded2064a033c8f23d47523db19443c3259d5546"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.15/solari-linux-x64"
      sha256 "5737ba7d4542a5aad8007ef7c3a3da8cc404dc855d33c223edcdabbb716e3914"
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

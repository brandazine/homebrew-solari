class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.29"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.29/solari-darwin-arm64"
      sha256 "d43463232d82e410271d1d95f17dd9a2862d01dcc92f22fef7534aef0040f13f"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.29/solari-darwin-x64"
      sha256 "157615d95fee7c7667e89ff1a453fa360eb94f51a8ec9ab74707959ec498974e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.29/solari-linux-arm64"
      sha256 "d90b9320cee3f1231c750fa10caf3369386c424675fd213e2b9d1fcf29c882f2"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.29/solari-linux-x64"
      sha256 "f56f5b768529407fa231b9cae92ef51cf56e499ef75bdf76140b0a901ab29ab2"
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

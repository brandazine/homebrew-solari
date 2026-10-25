class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.3.1/solari-darwin-arm64"
      sha256 "5dc9ec1ba9c02e49383a7f1bbdec83b3222a39d7c5bcfe94849b8012626094ab"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.3.1/solari-darwin-x64"
      sha256 "2eef46784426a678cfdecad31e5ed1c7d854197efdce636036211f66d5422d6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.3.1/solari-linux-arm64"
      sha256 "78c08e3183eec65f16dffea536a09eb4db1dbae009498c79d792d487c2df9909"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.3.1/solari-linux-x64"
      sha256 "110eddc0418d913e900159c8ce744eb82fd850ba1543501d1b1930c6c3637a36"
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

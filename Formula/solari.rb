class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.25"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.25/solari-darwin-arm64"
      sha256 "d6df7fc1cea7aa19423280776437ac9ba9a2d109f8c578430505cc3d75890ff4"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.25/solari-darwin-x64"
      sha256 "f58d36710deee704434751cb4de85d7061165044dbfa5b5c21879af8c7876644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.25/solari-linux-arm64"
      sha256 "0e8c63a49c1f5cb148f9ab565ce6d3eb3be6fe39e8ddbbab6ae844156f07b118"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.25/solari-linux-x64"
      sha256 "7f12a4998213f4115bfbef6daffcaa385d717f1d00932ff6baa893a0d2b9ee5f"
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

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.5/solari-darwin-arm64"
      sha256 "f1230573c815485b050078ed9b0e38715e02e028bcf34bb0c2a122f09c8d5772"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.5/solari-darwin-x64"
      sha256 "789f06d8b790ed9a9af76e9b89f13bccabc47e49bb175542b680b327a83e36a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.5/solari-linux-arm64"
      sha256 "c2067abf131fd538eb1fca6fea893496c54614ab242b70d209973391f5a7a06b"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.5/solari-linux-x64"
      sha256 "70085b915c4f06d62cb8446ab74812daf6a8bee0b4dc46cc39295c8db67183d3"
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

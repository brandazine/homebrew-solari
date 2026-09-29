class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0/solari-darwin-arm64"
      sha256 "0a319ed8a59294e47bc05da3bfe499b9564da7faeae0faea10d70555849de005"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0/solari-darwin-x64"
      sha256 "5ac212ef0dff157c8c4c986395f2dddb354fab6047b2b5dc3f16802540d379b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0/solari-linux-arm64"
      sha256 "4b40e6ad6d4d0cde9b6d2676b17ebecd6a4a915d740d5772fc5e0b2943ade9f1"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0/solari-linux-x64"
      sha256 "0c8f64a0fb5672cad5a3a9885bf2b77dfbe6c40e49dd120af71d8021afce5713"
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

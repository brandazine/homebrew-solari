class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.6/solari-darwin-arm64"
      sha256 "0f1f81b49c84f4fb8b885e7cb7bb4f52b0a06a66c12cfb054ed410937f0e7646"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.6/solari-darwin-x64"
      sha256 "8279d1035a0f44246e0e97650d15136d320161917a255b350d607e310f30a723"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.6/solari-linux-arm64"
      sha256 "66ec2293483c739a9f57c8e6f9986a499d49ce01d10400b6e7e1728e881ab79e"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.6/solari-linux-x64"
      sha256 "9b55dadeae85be05fa52fdcda3a5c6908630ba166809c6273773b8081040b966"
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

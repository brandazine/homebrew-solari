class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.1/solari-darwin-arm64"
      sha256 "33a3e72126074f17eb969a85d834315fe3ba78f2cec4502673d34ff74f3ae1ed"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.1/solari-darwin-x64"
      sha256 "3d6b71b1396a32968393557ed451cb2874dfb0c8fd75cd9e470b5b9decf616dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.1/solari-linux-arm64"
      sha256 "3b9c7cc9a51f688734421be8412853c5e3fc92b3bc168cdee4271e72486846f5"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.1/solari-linux-x64"
      sha256 "e9297336040e28f91b3ae8fdb323e1d76a35f3c44af9e41dd266f478ab32f0d1"
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

class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.28"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.28/solari-darwin-arm64"
      sha256 "cf9483f5877e5ab8880b817f8c6520e3c24696c9a7eb845296121e88fb4a9fa7"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.28/solari-darwin-x64"
      sha256 "f181114d3ccbf33de863ac547279fce11110f1894c48002c2e9140cab0e868ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.28/solari-linux-arm64"
      sha256 "b047597b0f79b4fd042f93240ef13fa27538b6b5df1ed2c4e98be34334d14410"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.28/solari-linux-x64"
      sha256 "7019070dfffc663bff20c94a4e963c38288d9fddcb42e0b8dbd8f2b41b18f399"
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

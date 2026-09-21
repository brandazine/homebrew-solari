class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.22"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.22/solari-darwin-arm64"
      sha256 "385635dc259cf195bb1c9a297234df706903c0858ad4c320084bf1527af22e67"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.22/solari-darwin-x64"
      sha256 "afb9aa8bd8544f0e81f96a90522a3cb7881e420520b5a5a7d6a5ad578c50d5c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.22/solari-linux-arm64"
      sha256 "79c8d9e24d99140c7b044b949dd6ba92e982454a6af6ce8b18498f9166b8edeb"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.22/solari-linux-x64"
      sha256 "cd89bb261f6bc0262cffcd080c0dae86457069bf4eab21c911078e5a920ba14d"
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

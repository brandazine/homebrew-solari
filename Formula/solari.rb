class Solari < Formula
  desc "SOLARI creator and brand intelligence from your terminal"
  homepage "https://solari.brandazine.com"
  version "1.0.0-alpha.12"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.12/solari-darwin-arm64"
      sha256 "482235f005cc60cdbc2f4941773a9d3918c651c029a3fba0c51cc1025b477ffe"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.12/solari-darwin-x64"
      sha256 "3ea31ca8233351d2f9f4c9bb0ba8c8f916957fe652a1384f5cf58398d7650ae0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.12/solari-linux-arm64"
      sha256 "e49a520242a56589326b832a376bab9e6439287877a3bbcb153ffd9c5345f7e8"
    end
    on_intel do
      url "https://github.com/brandazine/solari/releases/download/v1.0.0-alpha.12/solari-linux-x64"
      sha256 "82c702576021e2027a0cbdad4cfa06bb54f6e380f9f0fbda6cb75854717a4e8a"
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

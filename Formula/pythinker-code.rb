class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.1/pythinker-code-darwin-arm64.tar.gz"
      sha256 "1aa041ba04545e1bb9fc507d0e360f6866e6aee4f94ffdf5517b0a73179c56ae"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.1/pythinker-code-darwin-x64.tar.gz"
      sha256 "bf8757ed23754a3f232cf314872cfd85a91ea5771b3d936ea7394d2c8b0cff85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.1/pythinker-code-linux-arm64.tar.gz"
      sha256 "1989b65088a1d0fd41892fc6e1246d50ef691dfb46b7e7e1e0a7d182b0132b9a"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.1/pythinker-code-linux-x64.tar.gz"
      sha256 "1b1a8731c21a6599063ea0469375df86d436e2eaaf288b803030f336b57ffe18"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

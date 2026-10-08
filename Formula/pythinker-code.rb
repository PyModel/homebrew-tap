class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.0/pythinker-code-darwin-arm64.tar.gz"
      sha256 "de0b7876e528b760d7d790c1a514b42ab1375e0a94b23a9c04d78e728ace7b27"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.0/pythinker-code-darwin-x64.tar.gz"
      sha256 "f7efe01ab5641272956bf349c15ac07be2a9424899e05a63592f6cd8afe0e8dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.0/pythinker-code-linux-arm64.tar.gz"
      sha256 "751d10e861e3761a066f8817d66b744b575b383bda90e62d185ca92389f12b01"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.0/pythinker-code-linux-x64.tar.gz"
      sha256 "e32dc6e3ea675e3a55826783ab8a9325fdb00a1ae517d50e12ecb8c65b3ba185"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

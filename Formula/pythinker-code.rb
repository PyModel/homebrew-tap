class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.1/pythinker-code-darwin-arm64.tar.gz"
      sha256 "91d9300fb44ce464680f2ab2ec42e06fb34aaad135ed85d34a6af488a48d2e06"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.1/pythinker-code-darwin-x64.tar.gz"
      sha256 "d0d3d633a7796444109baf0a94f1808af7d3990696282fb91c59a25a934fce1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.1/pythinker-code-linux-arm64.tar.gz"
      sha256 "e44cb2c0aff02d453faee26d6c5cd75246f8ade9a4a18ce10a013878d5892d28"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.6.1/pythinker-code-linux-x64.tar.gz"
      sha256 "cf6a0046fc6b02514f5cb7feea81ac7ebaf395ae7e0ed6889d510472c28f888b"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.7.0/pythinker-code-darwin-arm64.tar.gz"
      sha256 "89204fb065f4989c7102fa640bb1903506daeff2c1652447d1ab4455f372ae57"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.7.0/pythinker-code-darwin-x64.tar.gz"
      sha256 "a15fb69a8bdc96510750e85b0263498daa61020b754ae8cb917d99855b5d5dda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.7.0/pythinker-code-linux-arm64.tar.gz"
      sha256 "4d0d7c03557f56a6ffecf25010747b71fd55ce0a24be6e98ebfa952d4c3c2330"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.7.0/pythinker-code-linux-x64.tar.gz"
      sha256 "a7415f0a6c6a84c3de46a453e845bbab2976ca678d42d70047eea0242eada0cf"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

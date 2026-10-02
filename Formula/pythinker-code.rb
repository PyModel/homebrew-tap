class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.0/pythinker-code-darwin-arm64.tar.gz"
      sha256 "6f90980623ffb8d4020acd65953e6294aa87b82a7773fc33dc40b0a435533301"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.0/pythinker-code-darwin-x64.tar.gz"
      sha256 "27ff5b6156a93d38f34cd7d3313c77e7370c5c880a8e75822458c864973ede15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.0/pythinker-code-linux-arm64.tar.gz"
      sha256 "c8e4da4c7cdd737cc32083fb075f359ec18b048576b0cc9ae7bd51fee414b1e2"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.0/pythinker-code-linux-x64.tar.gz"
      sha256 "1531caaa5e43520b86e5560abef11af16a3c189600f8247d8d6f2ab52c2b2c07"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

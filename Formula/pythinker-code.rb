class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.8.0/pythinker-code-darwin-arm64.tar.gz"
      sha256 "4055155bba63a374ae011d2a8a24a4e1b7918efa781810f0f584a58f20f463b9"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.8.0/pythinker-code-darwin-x64.tar.gz"
      sha256 "fb0409189755f3db5b651e0bff0d7c312ff27d590b718623abb90ac9bc547154"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.8.0/pythinker-code-linux-arm64.tar.gz"
      sha256 "08ab141f5d2ad3e5775329fec647bc8b23510d4fd13fab334daa4022e7c711ff"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.8.0/pythinker-code-linux-x64.tar.gz"
      sha256 "ba840dbbc46939afc8fcbd7fa31b671da7581c1587e23703ec7c109a3001281f"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.2/pythinker-code-darwin-arm64.tar.gz"
      sha256 "006b465cad037c5727333e40dcae6d2a3fd865cc65e2115e929adc80c406c33b"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.2/pythinker-code-darwin-x64.tar.gz"
      sha256 "4bee171b49894e9be64c80087401e5da0ed34edfe6e73a14e309b264478675b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.2/pythinker-code-linux-arm64.tar.gz"
      sha256 "00ccba8c48adc5086dce2412d295b8d06fb3abc4eb21f191d89c3b09cf019685"
    else
      url "https://github.com/PyModel/pythinker-code/releases/download/%40pymodel%2Fpythinker-code%402.5.2/pythinker-code-linux-x64.tar.gz"
      sha256 "e0044e23e1f926ee7d81155f319a103eec00ad8f10d830830869899dc08d5761"
    end
  end

  def install
    bin.install "pythinker"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/pythinker --version").strip
  end
end

class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by Pythoughts Labs"
  homepage "https://code.pythinker.com"
  url "https://registry.npmjs.org/@pythoughts/pythinker-code/-/pythinker-code-0.1.0.tgz"
  sha256 "54e0a5e2bb758e171e45ff6eeba3d77812838ef1286cbd4b36e9d5bc2b44dabf"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "pythinker", shell_output("#{bin}/pythinker --help")
  end
end

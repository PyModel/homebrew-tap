class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by Pythoughts Labs"
  homepage "https://code.pythinker.com"
  url "https://registry.npmjs.org/@pythoughts/pythinker-code/-/pythinker-code-0.7.0.tgz"
  sha256 "47136da396c6333b6c1e4c759ad3686170104def5f27342319442b2067eddfbd"
  license "MIT"

  depends_on "node"

  # The bundled @opentui prebuilt dylib has no Mach-O headerpad space, so
  # brew's install-linkage fixup prints a non-fatal "Failed changing dylib ID"
  # warning. The library is loaded by absolute path at runtime; the install
  # works. Upstream fix requires OpenTUI to link with -headerpad_max_install_names.
  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      During install, Homebrew may print a non-fatal warning:
        "Failed changing dylib ID of .../libopentui.dylib"
      This is expected (a prebuilt library without Mach-O headerpad space)
      and does not affect functionality.
    EOS
  end

  test do
    assert_match "pythinker", shell_output("#{bin}/pythinker --help")
  end
end

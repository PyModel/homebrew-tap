class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by Pythoughts Labs"
  homepage "https://code.pythinker.com"
  url "https://registry.npmjs.org/@pymodel/pythinker-code/-/pythinker-code-0.21.1.tgz"
  sha256 "0ff5c59aa59cc25b411a10bb486a22e5b44c430daf7bf7be71206b12a99f3ac0"
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

class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by PyModel"
  homepage "https://code.pythinker.com"
  url "https://registry.npmjs.org/@pymodel/pythinker-code/-/pythinker-code-2.4.1.tgz"
  sha256 "e9d8d8d3f1ddd6ce8bf84e00bd50dbe9b25ec0320b82bb506522a18d80b89c1d"
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

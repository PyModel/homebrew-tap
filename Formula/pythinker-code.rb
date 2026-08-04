class PythinkerCode < Formula
  desc "Terminal-native AI engineering agent by Pythoughts Labs"
  homepage "https://code.pythinker.com"
  url "https://registry.npmjs.org/@pythoughts/pythinker-code/-/pythinker-code-0.6.0.tgz"
  sha256 "55fe585cbd4e77289cb0ac7f8e720ea6a2f7f6f300c26312e7a8532d1558a73b"
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

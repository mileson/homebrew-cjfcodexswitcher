class Cjfcodexswitcher < Formula
  include Language::Python::Virtualenv

  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0a5ca0a2816d43e839b429fadfa8ba359576c604a49552fbd03f4e1aeab079d9"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/codex-switcher --help")
    assert_match "Codex", output
  end
end

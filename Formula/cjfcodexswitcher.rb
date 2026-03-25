class Cjfcodexswitcher < Formula
  include Language::Python::Virtualenv

  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e0a35a5819b4ef7d59de89503980308b318a46f13e9d037fd8386cd94202de4a"
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

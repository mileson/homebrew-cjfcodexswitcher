class Cjfcodexswitcher < Formula
  include Language::Python::Virtualenv

  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f6681fed2a7a779e00baefc776cb218f3bc5b5d87b2b53c17ac059c37feb9a48"
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

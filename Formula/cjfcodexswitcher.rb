class Cjfcodexswitcher < Formula
  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "0a5ca0a2816d43e839b429fadfa8ba359576c604a49552fbd03f4e1aeab079d9"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    system venv/"bin/python", "-m", "ensurepip", "--upgrade"
    system venv/"bin/pip", "install", "--upgrade", "pip", "setuptools", "wheel"
    system venv/"bin/pip", "install", buildpath
    bin.install_symlink venv/"bin/codex-switcher"
    bin.install_symlink venv/"bin/csw"
  end

  test do
    output = shell_output("#{bin}/codex-switcher --help")
    assert_match "Codex", output
  end
end

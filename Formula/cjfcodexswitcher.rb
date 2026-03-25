class Cjfcodexswitcher < Formula
  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.10.tar.gz"
  version "0.1.10"
  sha256 "21c317c019cde6d966a16f8600b8b20c1b9f2b1077d6b67e7a9a2d05a5af94e7"
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

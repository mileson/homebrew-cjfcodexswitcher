class Cjfcodexswitcher < Formula
  desc "Codex account switcher with live quota view and agent-friendly CLI"
  homepage "https://github.com/mileson/CJFCodexSwitcher"
  url "https://github.com/mileson/CJFCodexSwitcher/archive/refs/tags/v0.1.8.tar.gz"
  version "0.1.8"
  sha256 "d37d66344d2c7feb05a7481d584ed0a75e6c84a9d8fbfeea20b2dc131937a07d"
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

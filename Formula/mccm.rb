class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.4.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.4.0/mccm-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "0ee689324697bd3edb964fde422efe9d3c7f9ba27db3642eb4312ee52833ea6e"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.4.0/mccm-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "8086495d1a094f258a0f3fdbee9232e60f790cd9ceef49d93bee2f230b80fd0f"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

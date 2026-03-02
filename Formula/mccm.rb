class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.1.0/mccm-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "f5d071451303f23eefdd3cf5407e39fe353df84cd1d9cbd7f396ba126e81b744"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.1.0/mccm-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "493805147f243d091e126687bcf439177fcd3014f82d851e08ba0afa20677081"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

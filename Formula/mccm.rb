class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.2.0/mccm-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "e5cd03dc727d273ad0ea2806c478b190bf16c6310f8e5bf58cbed1088d5f62ab"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.2.0/mccm-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "4284e3f788c1260bcee0b79ab96bbecffcc63d085c7f95f7d117bf57e16a9789"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

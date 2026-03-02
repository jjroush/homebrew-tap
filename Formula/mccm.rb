class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.4.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.4.1/mccm-v0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "8fc64407fde7fb5007c097a99e08f219af31ac604c422696abb9dc2d7392a941"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.4.1/mccm-v0.4.1-x86_64-apple-darwin.tar.gz"
    sha256 "e2a92ba96388ec9748da6d36f38501fc6962d355cb101355041d989f136bfb50"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

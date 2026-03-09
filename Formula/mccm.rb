class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.4.3"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.4.3/mccm-v0.4.3-aarch64-apple-darwin.tar.gz"
    sha256 "2a7a5bfb9f32773b33627831faebf5f63e8f7bbd969e0889532a32068c4665e9"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.4.3/mccm-v0.4.3-x86_64-apple-darwin.tar.gz"
    sha256 "a0aa8a13ec712dfb1c2be08add290c05da6337f4d583ff8015966ee96baeaab4"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

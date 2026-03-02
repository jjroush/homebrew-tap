class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.3.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.3.0/mccm-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "99589380e39c4f970a0d55a69c1051a0235cf5e87276b62405976a9c918fd21b"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.3.0/mccm-v0.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "ef943dc7ac1a2915e0367ef73f31a44f1b972fa85f77d690b5a4f4045a15fd21"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end


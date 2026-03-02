class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.4.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.4.2/mccm-v0.4.2-aarch64-apple-darwin.tar.gz"
    sha256 "23edabc1a25d14a6a8daa6c8795ee72f9ed54aa408a0590ef332c420ad896c59"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.4.2/mccm-v0.4.2-x86_64-apple-darwin.tar.gz"
    sha256 "48e432fc69ce8accd98bd5b8e78663531b7a012824b20e3ca6a788e591d50ea3"
  end

  def install
    bin.install "mccm"
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

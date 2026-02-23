class Cagle < Formula
  desc "TUI tool to promote Claude Code project permissions to global settings"
  homepage "https://github.com/jjroush/cagle"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/cagle/releases/download/v0.2.0/cagle-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "cc7744b4302b8d1829486085ad007e30765ad70a82227eb8882cbca4b55c4db7"
  else
    url "https://github.com/jjroush/cagle/releases/download/v0.2.0/cagle-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "c8aeebfa0d0effc23f833d149b32e7db1e0302aac9e79ce8d4efdb0e135282f3"
  end

  def install
    bin.install "cagle"
  end

  test do
    assert_match "No .claude/settings.local.json found",
      shell_output("#{bin}/cagle 2>&1", 1)
  end
end

class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.5.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.5.1/mccm-v0.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "994e94b56fd17cff4f7e8c59f553ca23578fdc7e009b35a6b05f078079fd6f18"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.5.1/mccm-v0.5.1-x86_64-apple-darwin.tar.gz"
    sha256 "6450a0d1a9d1f947bdcc8ac5c201fc620e989eb7ea7780b69fd49c1813c23615"
  end

  def install
    bin.install "mccm"
  end

  def caveats
    <<~EOS
      To install Claude Code hooks and start the menu bar daemon
      (LaunchAgent that runs at login), run:

        mccm install

      The menu bar daemon will appear in your menu bar immediately
      and auto-start on subsequent logins.

      To remove everything:

        mccm uninstall
    EOS
  end

  test do
    assert_match "mccm",
      shell_output("#{bin}/mccm --help")
  end
end

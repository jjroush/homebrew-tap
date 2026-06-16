class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.6.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.6.0/mccm-v0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "d8d42dc89b8f32bc79ae12ae8cefb84e1eb44567cadb55fc5fda8652aace99ba"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.6.0/mccm-v0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "49acda49440ff91e23290618117a2e38d3f78ce639e0f7d7c4f4946a8c8a2bea"
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

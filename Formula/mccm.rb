class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.5.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.5.0/mccm-v0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "2e2eef9848206d15a412c9b797de93c0edf046a77a59181677a754432556f600"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.5.0/mccm-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "bcf232c482ec82ec96733f6469795dee0c8aeb095ec4d367d7d3f9c8d818d5d6"
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

class Mccm < Formula
  desc "TUI dashboard for monitoring Claude Code sessions"
  homepage "https://github.com/jjroush/mccm"
  version "0.5.2"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/jjroush/mccm/releases/download/v0.5.2/mccm-v0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "4995dc6f1708e78afb81e71bb1732925bf3f431f807f369c1a9567df55d62e43"
  else
    url "https://github.com/jjroush/mccm/releases/download/v0.5.2/mccm-v0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "168ff5a9b9da6cb2e5781098efce7563d64b4cb0d9391330a6f09df4a7f46169"
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

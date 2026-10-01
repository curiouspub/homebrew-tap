# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.6/curious_0.1.6_darwin_amd64.tar.gz"
      sha256 "01f19e937030e124791cb311caa83e394db60f375423eee848f4b8cc1f1d0aa9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.6/curious_0.1.6_darwin_arm64.tar.gz"
      sha256 "881d868432e163a1b883ffdf34983ac24b09530187a1d5e28e776c576d1ea3e6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.6/curious_0.1.6_linux_amd64.tar.gz"
      sha256 "e4c564548878ba9dea529e37854e1e932b7d8a15308ebe8258c68c1d08b2d436"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.6/curious_0.1.6_linux_arm64.tar.gz"
      sha256 "235664f2f9165098c5a15a9b3058b6f5932dcc4b4dc1657155e6ff2119656ef3"
    end
  end

  def install
    bin.install "curious"
  end

  def caveats
    <<~EOS
      Replacing the older cask, curious? Installing this formula takes over
      the curious command, and removing the cask afterwards takes the command
      away again. Remove the cask, then link the formula:
        brew uninstall --cask curious && brew link curiouspub/tap/curiouspub

      To remove the cask before installing this formula instead:
        brew uninstall --cask curious && brew install curiouspub/tap/curiouspub
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curious version")
  end
end

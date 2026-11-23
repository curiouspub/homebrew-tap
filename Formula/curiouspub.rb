# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.8/curious_0.1.8_darwin_amd64.tar.gz"
      sha256 "28b68e89465efa180ad93c1614fd6f10048ebf5c614e939fc34e635beab0f255"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.8/curious_0.1.8_darwin_arm64.tar.gz"
      sha256 "271b0abd955fff1895ac89d0295d821b648462be97d80d44e285801328580bd6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.8/curious_0.1.8_linux_amd64.tar.gz"
      sha256 "a07e3d8a9d463bb99d0b6d5e6c4754351720f67146b6c953c01266b9d653d716"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.8/curious_0.1.8_linux_arm64.tar.gz"
      sha256 "87952a88a2bcae9d2a23b0252757f6503c58cce9a66bd4ffb978b454c7439d22"
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

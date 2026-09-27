# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.4/curious_0.1.4_darwin_amd64.tar.gz"
      sha256 "bb54fa753fcb48f806047a1ef2a4f1d5189c6c85e3e437b29005cac1e05a1284"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.4/curious_0.1.4_darwin_arm64.tar.gz"
      sha256 "c08ae2d2e1b93421d323f7566fc30c9e4838884c81ae64eab502877621762bc4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.4/curious_0.1.4_linux_amd64.tar.gz"
      sha256 "cf7ad81fff4e96331b9875e17f99c626271ff724a9999025c3359c2f57ba86fc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.4/curious_0.1.4_linux_arm64.tar.gz"
      sha256 "9e625bb1bfdc0ce809d0b146e554809a621a32f806aa170cc713adcba73bb212"
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

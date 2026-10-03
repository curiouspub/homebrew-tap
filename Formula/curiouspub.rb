# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.7/curious_0.1.7_darwin_amd64.tar.gz"
      sha256 "4f32566bffd9e69575a8adc518a34f0e0b00af1cad39edf236864ac628b5cde1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.7/curious_0.1.7_darwin_arm64.tar.gz"
      sha256 "eac77c3b27e29e4341b5975c363e3146e022f8d7f8f433a4e96b13e5f9f4ca04"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.7/curious_0.1.7_linux_amd64.tar.gz"
      sha256 "412ab5ee5f6580870406a5f889fbe710bfd3fd5cfa526934040dc9a470ef2159"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.7/curious_0.1.7_linux_arm64.tar.gz"
      sha256 "28600be8294999dd5e346fddf00ff04fded5a0f12f643ab6b6430cdd0016facc"
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

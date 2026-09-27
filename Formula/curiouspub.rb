# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.3/curious_0.1.3_darwin_amd64.tar.gz"
      sha256 "f58f0188f4ccabd54b617f3104f2beb6e6bb0e3a77148dcc01f2a9fe2c44956a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.3/curious_0.1.3_darwin_arm64.tar.gz"
      sha256 "dfdb5b6e674b6b3de3f22d8ca6d5b5600bb13293b16447b98dcbcb021188461d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.3/curious_0.1.3_linux_amd64.tar.gz"
      sha256 "cd9638a6dbda99ddde62080de09e87960928478c28183b2c093befedf58bf07b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.3/curious_0.1.3_linux_arm64.tar.gz"
      sha256 "54c184fc42cba537fded30c403f480a11203c0ebee5b15dd2e0f9991f015f31c"
    end
  end

  def install
    bin.install "curious"
  end

  def caveats
    <<~EOS
      Replacing the older cask, curious? It owns the curious command, so
      this formula is not linked while the cask is installed. Remove the
      cask, then link the formula:
        brew uninstall --cask curious && brew link curiouspub/tap/curiouspub

      To remove the cask before installing this formula instead:
        brew uninstall --cask curious && brew install curiouspub/tap/curiouspub
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curious version")
  end
end

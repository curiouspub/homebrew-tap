# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.1/curious_0.1.1_darwin_amd64.tar.gz"
      sha256 "cb314843a7cb3e7f075e423320d6f50b7983dab466ba863fe47f855402c5c80b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.1/curious_0.1.1_darwin_arm64.tar.gz"
      sha256 "fcacbc4b8c6123f721139830e5c86df1980eb0c5b3dec4fd6b8442bb6f380cb1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.1/curious_0.1.1_linux_amd64.tar.gz"
      sha256 "cd0a23f9eed6f5926be624f61561f3a907415e1d5dec961d987556c7236bf349"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.1/curious_0.1.1_linux_arm64.tar.gz"
      sha256 "50276b0400b14cd2f644db4f6a66ee2d19724422ec61926a6585e218d1a3d36e"
    end
  end

  def install
    bin.install "curious"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curious version")
  end
end

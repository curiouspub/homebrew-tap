# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.2/curious_0.1.2_darwin_amd64.tar.gz"
      sha256 "bf8493eb7dcd6e3c9f5c012d8fe1cc59c7d26621939063b2ecf76a71d1fcde1c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.2/curious_0.1.2_darwin_arm64.tar.gz"
      sha256 "309d03312e54a43cab604fdb9f17f622479d77137eb00805cb4c256145e33f7e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.2/curious_0.1.2_linux_amd64.tar.gz"
      sha256 "df6bffb9f7307ae2a7f16c7c17d2588d582a35427d233de2fe5b2c975051fb14"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.2/curious_0.1.2_linux_arm64.tar.gz"
      sha256 "7accbf334876b3814181484302ba2bd0f7ada2b9d69a78e291fbf710567c60ef"
    end
  end

  def install
    bin.install "curious"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/curious version")
  end
end

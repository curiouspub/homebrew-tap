# Written by the release workflow from this release's checksums.txt.
# Edits here are overwritten by the next release.
class Curiouspub < Formula
  desc "Pack an Astro project, upload it, and stream the build"
  homepage "https://curious.pub/"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.5/curious_0.1.5_darwin_amd64.tar.gz"
      sha256 "ffd31c61564f739800c3318687530b5f0408d9c8bc5fd2949d80cd2a49aa0568"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.5/curious_0.1.5_darwin_arm64.tar.gz"
      sha256 "2b9e5338290dbaeb1b7446fbf99596f7ea39a49689dddedd062b3c58e4956dd4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.5/curious_0.1.5_linux_amd64.tar.gz"
      sha256 "a8847aaf7b46a2853bc2bb769e5886b26b3a7f07b6b67e4221cea8de7cf31955"
    end
    if Hardware::CPU.arm?
      url "https://github.com/curiouspub/cli/releases/download/v0.1.5/curious_0.1.5_linux_arm64.tar.gz"
      sha256 "f9f1d6ec258a669c3cfd580f919c0895559ed59d40ba549f0bebb13fc43a8f72"
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

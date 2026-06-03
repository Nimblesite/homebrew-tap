# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.1/napper-v0.12.1-osx-arm64.tar.gz"
      sha256 "9f89458792d55edc4522c72fa34550a841913394b8bb64d4845f59ffe5c030c1"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.1/napper-v0.12.1-osx-x64.tar.gz"
      sha256 "df16af21cb6644e45329342f1aa6861deb11b037f1dce4ba4bf277d151d9ea22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.1/napper-v0.12.1-linux-arm64.tar.gz"
      sha256 "a53da79a71b6d9d3f9b41faf1f0420e5456080ec2b090daa760719fb2f300a30"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.1/napper-v0.12.1-linux-x64.tar.gz"
      sha256 "ea7e86aff8b9490203ea87d5e75611153ca0d47e59e1a937c8bad2a229cdb9b6"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

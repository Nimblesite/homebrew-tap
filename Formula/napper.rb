# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.7"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.7/napper-v0.13.7-osx-arm64.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.7/napper-v0.13.7-osx-x64.tar.gz"
      sha256 "eca353f17ae5c211a752a14c7122dc6052828eae5a9f735af3861b158164645d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.7/napper-v0.13.7-linux-arm64.tar.gz"
      sha256 "3e0c83f9f9b950818b20b8bec3a9ad0231b1fe01def9a04e0055192aa5fa1ba6"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.7/napper-v0.13.7-linux-x64.tar.gz"
      sha256 "90293d48e578c3fe8df647fc083d8a8ffb29245b66c94701c8f4974de356b4c9"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

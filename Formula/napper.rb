# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.6"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.6/napper-v0.13.6-osx-arm64.tar.gz"
      sha256 "6c5fae7d9c5536f5f7a99b0edad27736a00b07e397a0bd6d6348f5583a853ba7"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.6/napper-v0.13.6-osx-x64.tar.gz"
      sha256 "095b78577ee9271b26b3a8d9793b1e55ba031a5471ad03479919792eb6e78daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.6/napper-v0.13.6-linux-arm64.tar.gz"
      sha256 "4acd8b355c7d7d1399fb002dbcae5b98c9a0999ff84591b97079043e48b3d748"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.6/napper-v0.13.6-linux-x64.tar.gz"
      sha256 "76ee08c6e1892f7146db868587551ec383bebfce824f046f0ddbb84c2acc09a5"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

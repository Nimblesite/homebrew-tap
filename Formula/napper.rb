# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.0/napper-v0.13.0-osx-arm64.tar.gz"
      sha256 "a1bfe90c894d152a8feef61d46c0683b33cf3facbdb0edac38173d1dd54ff897"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.0/napper-v0.13.0-osx-x64.tar.gz"
      sha256 "2d8e46c896ef1c7f7173620d04b571bee28c8ae83657346003b5e46653c1d876"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.0/napper-v0.13.0-linux-arm64.tar.gz"
      sha256 "a4a3f44d0c782dce5b9d279fcf4794514e082f2a0e1cc6727a12078df670f161"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.0/napper-v0.13.0-linux-x64.tar.gz"
      sha256 "5dfa70e92f2eeb736530196e99c1cfaab21c511b376a66b99edee9e540839502"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

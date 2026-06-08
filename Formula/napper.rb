# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.3"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.3/napper-v0.13.3-osx-arm64.tar.gz"
      sha256 "6418169f27d4bb9ac0c8ecf3aa6ccb28c32b69bea21ef689eeb5bdeca2074a46"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.3/napper-v0.13.3-osx-x64.tar.gz"
      sha256 "8e9585e7b5632fbb5e11a0a015843e16cfc185ec6e92f9f161d3f1ebc858cb8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.3/napper-v0.13.3-linux-arm64.tar.gz"
      sha256 "03ce4ba6181feb7376249e3b8346ba458a0c75098c59a759112ede99f76aabf3"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.3/napper-v0.13.3-linux-x64.tar.gz"
      sha256 "d00faf090e2ec2a1aca5fe3977cc39b0ca898e183829e7e3073e81a03975bb4d"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

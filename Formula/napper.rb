# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.1/napper-v0.13.1-osx-arm64.tar.gz"
      sha256 "0140512ddbcac7011332a2e8fe82e0c1ac0773942a3a555aa8e1a634fef29880"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.1/napper-v0.13.1-osx-x64.tar.gz"
      sha256 "e1be85cd9060ee1d662251748cac17aaa8a8f62cb72381d94834d73e1243afc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.1/napper-v0.13.1-linux-arm64.tar.gz"
      sha256 "ba9ed81139d9a16b97dd211d7ccd2c51e1a8fe6192cc4d533efcb1eb5ba7928f"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.1/napper-v0.13.1-linux-x64.tar.gz"
      sha256 "bd62416c6e76c3969f6f4f79393b621400561b0dfa465ea1232a9666091f7f32"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

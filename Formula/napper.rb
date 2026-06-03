# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.0/napper-v0.12.0-osx-arm64.tar.gz"
      sha256 "c9e670a08f11436c8735e173265c79cd373a4e4b1f036c66a6c20e48ff9a15ee"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.0/napper-v0.12.0-osx-x64.tar.gz"
      sha256 "e79e31fd09fc8de4852397fab82c8672fd773e866f556e8f59ec80844dca0b5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.0/napper-v0.12.0-linux-arm64.tar.gz"
      sha256 "5c7059799fc9b3a0f15d2d745f66faf4dfc288d07dcd6eb78d19780eebc3431a"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.0/napper-v0.12.0-linux-x64.tar.gz"
      sha256 "5111a1e80113379cf7b32c53e1d5caf90fea6dc01ab6ab63a97b7001bf9b4daf"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

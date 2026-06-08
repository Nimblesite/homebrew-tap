# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.4"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.4/napper-v0.13.4-osx-arm64.tar.gz"
      sha256 "09edf224548c8a6e977ca72f7d942fd52c9dae254b834efafd19ce7a580d9457"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.4/napper-v0.13.4-osx-x64.tar.gz"
      sha256 "21d569045790ebec382d8164334083cb9e18c87e03362b8e7cf4212159aca816"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.4/napper-v0.13.4-linux-arm64.tar.gz"
      sha256 "2acf7f3425a9c031ae7343ffad9690afd7215acc6eeccb70be9798adeb433cab"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.4/napper-v0.13.4-linux-x64.tar.gz"
      sha256 "099a1e255c1aa7c1f08e67259c1bbc773b6ed53754a625368a2a27d19aa5f3a9"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

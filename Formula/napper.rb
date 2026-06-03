# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.12.2"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.2/napper-v0.12.2-osx-arm64.tar.gz"
      sha256 "b01820348c31b875306ecfe152c0caa145655c763e08bd8c5ad22d8e76d4e9db"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.2/napper-v0.12.2-osx-x64.tar.gz"
      sha256 "39f73f6f8e8fac932d8d581e09fcd697ae966da8d1e5a1eac22e5027d5ba1293"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.2/napper-v0.12.2-linux-arm64.tar.gz"
      sha256 "8e68a784ef5f534414f7fd31cd6e0628bdc5aae3cd9f5e322f2aefa814e5a2bc"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.12.2/napper-v0.12.2-linux-x64.tar.gz"
      sha256 "d19c9d6b717e31ae8ffa39ca4feb5af064648c0f88d3313d0ab91ddb37dff376"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

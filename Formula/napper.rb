# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.5"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.5/napper-v0.13.5-osx-arm64.tar.gz"
      sha256 "51805b68ffc461fdfa86426db9aab4200368a2a38c467a73976f2f5296901073"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.5/napper-v0.13.5-osx-x64.tar.gz"
      sha256 "cfdca5823182804c0e8f94a274cbcdbd60cd75a0749621492d14b1911ba3fa7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.5/napper-v0.13.5-linux-arm64.tar.gz"
      sha256 "21c8ca8ab30c9bef5e08117d2be951f662b9301825ff5e8e5944460d5f2507e1"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.5/napper-v0.13.5-linux-x64.tar.gz"
      sha256 "4066196a075f3cf8111a4c61aaad0933f11b634b2ebb29947b7e369179f99c1a"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

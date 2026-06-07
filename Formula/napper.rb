# typed: false
# frozen_string_literal: true

class Napper < Formula
  desc "CLI-first, test-oriented HTTP API testing tool. Send requests, run assertions, manage environments."
  homepage "https://napperapi.dev"
  license "MIT"
  version "0.13.2"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.2/napper-v0.13.2-osx-arm64.tar.gz"
      sha256 "296d8bb8508e6be8da103f52a103ef9a4b1a81fdd63d06b63f6ffcf2b000353f"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.2/napper-v0.13.2-osx-x64.tar.gz"
      sha256 "746b8a35f28ce87801cd7b959d10c796f7f87d4f79a718a60963f48b5e981fbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.2/napper-v0.13.2-linux-arm64.tar.gz"
      sha256 "e3790618063da30fc2e24c74e09628fadfa6e97a43baa9b3b60024119f67f1ca"
    end
    on_intel do
      url "https://github.com/Nimblesite/napper/releases/download/v0.13.2/napper-v0.13.2-linux-x64.tar.gz"
      sha256 "ad34cf1369c2758af799eb4b60c283722d12d422a7dcbae59c9b4e1923955400"
    end
  end

  def install
    bin.install "napper"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/napper --version")
  end
end

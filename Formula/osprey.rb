# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.19.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.19.0/osprey-0.19.0-darwin-arm64.tar.gz"
      sha256 "b527d71ab21237c1da2c1b17818c09b88c7458482d8503d6f49be4f3f1b0a95a"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.19.0/osprey-0.19.0-linux-x64.tar.gz"
    sha256 "f465d7b6c9dfb481fba830c61886f8e1fee1987dc7a44af2095934b8405e93b7"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.19.0", shell_output("#{bin}/osprey --version")
  end
end

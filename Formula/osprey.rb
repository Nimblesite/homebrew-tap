# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.8.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.8.0/osprey-0.8.0-darwin-arm64.tar.gz"
      sha256 "b33ada0b3abf4fb4353f43d9f51f47880db05ee3634662aee02598398f2f3e76"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.8.0/osprey-0.8.0-linux-x64.tar.gz"
    sha256 "3860ddf6b9966ef70ccd1a79e82feb9b7f55d979de90f79f6104a5725f9dd6a4"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.8.0", shell_output("#{bin}/osprey --version")
  end
end

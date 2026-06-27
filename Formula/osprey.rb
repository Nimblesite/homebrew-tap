# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.6.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.6.0/osprey-0.6.0-darwin-arm64.tar.gz"
      sha256 "c8e3a5e802b914d51ba2ec61625056f7d1dfd069f98963956e9c514faaceb534"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.6.0/osprey-0.6.0-linux-x64.tar.gz"
    sha256 "f610ab6d3d2de6d905491f8c991577614c263f577593a3b8e6c902159d58ff8b"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.6.0", shell_output("#{bin}/osprey --version")
  end
end

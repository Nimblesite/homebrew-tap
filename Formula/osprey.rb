# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.31.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.31.0/osprey-0.31.0-darwin-arm64.tar.gz"
      sha256 "efddc97ee9bf1534cd205f1f14cbeb4214491ef5aa2e3702863e0ff0b563857f"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.31.0/osprey-0.31.0-linux-x64.tar.gz"
    sha256 "b64a0a8f77346fc27470865f2b7d3f19ea1f6fcda881e4d59c886fa030c8772b"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.31.0", shell_output("#{bin}/osprey --version")
  end
end

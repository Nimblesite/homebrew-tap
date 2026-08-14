# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.16.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.16.0/osprey-0.16.0-darwin-arm64.tar.gz"
      sha256 "7385af60f944e83d9dfc38fb0345e4149d138992b11968dc111d36a9b0568a1f"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.16.0/osprey-0.16.0-linux-x64.tar.gz"
    sha256 "760a399ede5f83601760b2a66e7b1b213b873bb5f463ad973c145aa287faa9c5"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.16.0", shell_output("#{bin}/osprey --version")
  end
end

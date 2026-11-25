# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.32.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.32.0/osprey-0.32.0-darwin-arm64.tar.gz"
      sha256 "8fec0b83735319030270bc6968daf047bdf09b7eb66a9cd7bca4f2f5c7fc141f"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.32.0/osprey-0.32.0-linux-x64.tar.gz"
    sha256 "63a885c30ff5e6956bd0fc7e6d63293d9fca0a647549ac4c322302df359a308c"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.32.0", shell_output("#{bin}/osprey --version")
  end
end

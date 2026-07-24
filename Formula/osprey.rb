# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.13.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.13.0/osprey-0.13.0-darwin-arm64.tar.gz"
      sha256 "3067265ba62980f7b2c081eeb291e1d36b96305c3f4be1c3d3af99c1857f5bce"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.13.0/osprey-0.13.0-linux-x64.tar.gz"
    sha256 "3eb3ebe3c23ca71d03b62538c80cff539c211ae4dec04058c9f81aff576c3d30"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.13.0", shell_output("#{bin}/osprey --version")
  end
end

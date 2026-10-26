# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.23.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.23.0/osprey-0.23.0-darwin-arm64.tar.gz"
      sha256 "36d709735b442303a68923a18c4a8df35a06c12ba920f923d65f05d851eb29bb"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.23.0/osprey-0.23.0-linux-x64.tar.gz"
    sha256 "eb62647282106cf42de2aee6ba4be07a2bd15f36a749345ddf7b8500c8fdd665"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.23.0", shell_output("#{bin}/osprey --version")
  end
end

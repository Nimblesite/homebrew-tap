# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.11.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.11.0/osprey-0.11.0-darwin-arm64.tar.gz"
      sha256 "b6b78ec3412a21690660540f90e997d3e2943be8826e17a0a2ef3df89b3ed53b"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.11.0/osprey-0.11.0-linux-x64.tar.gz"
    sha256 "780e061005021dea7ea6bb0f142665a8bc8141868b821309c1d56b4d19d92628"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.11.0", shell_output("#{bin}/osprey --version")
  end
end

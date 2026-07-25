# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.14.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.14.0/osprey-0.14.0-darwin-arm64.tar.gz"
      sha256 "c3b1cd19748338bb109b4ab1e9b239f968ffeeb4c7c210cf8d3b954808e08cea"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.14.0/osprey-0.14.0-linux-x64.tar.gz"
    sha256 "6b27415ff4e5259ffbae677d76513eea5539c2e9f85eb124b5a849048df87804"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.14.0", shell_output("#{bin}/osprey --version")
  end
end

# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.7.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.7.0/osprey-0.7.0-darwin-arm64.tar.gz"
      sha256 "0d6cdd9d1c58bffb605bec2638d1414dd78d5ba76bf3893789f3823f68310734"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.7.0/osprey-0.7.0-linux-x64.tar.gz"
    sha256 "d77fd8c1f45be8afd0f6035e7bec0a97c46bf6733517fe3fc4db57bd0d8ddbff"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.7.0", shell_output("#{bin}/osprey --version")
  end
end

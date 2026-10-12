# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.18.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.18.0/osprey-0.18.0-darwin-arm64.tar.gz"
      sha256 "53b18f34166b02c7102d99b7a52b3e271830950302b8c1537ad5ad2e4f3d90ce"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.18.0/osprey-0.18.0-linux-x64.tar.gz"
    sha256 "0212c367bda2f93f5eef53d1eecbb8833b5554cc73d3635a1c50ded1bcc0657b"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.18.0", shell_output("#{bin}/osprey --version")
  end
end

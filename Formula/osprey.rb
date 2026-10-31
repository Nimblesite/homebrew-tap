# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.26.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.26.0/osprey-0.26.0-darwin-arm64.tar.gz"
      sha256 "33d7644bdc326ccea6c126e0bf0d5fdc347c98e41f20706f46641c37fed2be19"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.26.0/osprey-0.26.0-linux-x64.tar.gz"
    sha256 "84691aadc29ea209bbd6d60874968d3caf3c28c253bf7769abfb52a4a2ebde03"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.26.0", shell_output("#{bin}/osprey --version")
  end
end

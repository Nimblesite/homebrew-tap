# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.22.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.22.0/osprey-0.22.0-darwin-arm64.tar.gz"
      sha256 "9fea80da6f80a5479552c44e3267aa47078b2fd28c67b182f8f9573da0e3657c"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.22.0/osprey-0.22.0-linux-x64.tar.gz"
    sha256 "e9ed49f7d1444eeda9fcdc02b010363f3c549b104a421e64aa0b549289af2d4b"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.22.0", shell_output("#{bin}/osprey --version")
  end
end

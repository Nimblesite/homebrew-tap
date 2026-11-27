# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.34.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.34.0/osprey-0.34.0-darwin-arm64.tar.gz"
      sha256 "5a7baf5c228836984b9e66783b09f97e0fb6c1deb371adfda6ac76039f6619a5"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.34.0/osprey-0.34.0-linux-x64.tar.gz"
    sha256 "1e356e8c71481116fb566f44665cea5c362523c600d1b85a10b9db324768d390"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.34.0", shell_output("#{bin}/osprey --version")
  end
end

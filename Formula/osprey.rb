# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.33.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.33.0/osprey-0.33.0-darwin-arm64.tar.gz"
      sha256 "6e6c2dbe3aa1c091c19be3d1ba37a3d8c710594a77dc0f56e84c2a2471b1c9aa"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.33.0/osprey-0.33.0-linux-x64.tar.gz"
    sha256 "40c05f7eb0a8a231b3734ebab2cffc81223b049282fa783979363896846a1b70"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.33.0", shell_output("#{bin}/osprey --version")
  end
end

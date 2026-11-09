# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.29.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.29.0/osprey-0.29.0-darwin-arm64.tar.gz"
      sha256 "0d2a58c07989a393e0849a0aac0f69f509a3a49521e994cc3e879ee80f39aff1"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.29.0/osprey-0.29.0-linux-x64.tar.gz"
    sha256 "d2402fdbc51712411fa39c2baf495820a404df807f2baff97eeb312cbf10f274"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.29.0", shell_output("#{bin}/osprey --version")
  end
end

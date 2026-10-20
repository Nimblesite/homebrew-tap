# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.21.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.21.0/osprey-0.21.0-darwin-arm64.tar.gz"
      sha256 "8e32d623f682fb5d7bd17d8195152526dab24813f37ae3e59777a72986f874c3"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.21.0/osprey-0.21.0-linux-x64.tar.gz"
    sha256 "ed8861439a00efe5e32654c2fff4611383fe376253c991ab054c42fb6eb87407"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.21.0", shell_output("#{bin}/osprey --version")
  end
end

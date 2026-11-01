# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.28.2"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.28.2/osprey-0.28.2-darwin-arm64.tar.gz"
      sha256 "f764d7140c926956955627ddef24db0d839800d421c6a19eb8db3a456fe13ade"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.28.2/osprey-0.28.2-linux-x64.tar.gz"
    sha256 "5bef0c9ec44e54fefa5cb65a3ee7ee924e220a32296fc859e7a53e936d46794b"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.28.2", shell_output("#{bin}/osprey --version")
  end
end

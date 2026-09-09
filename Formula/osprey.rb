# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.17.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.17.0/osprey-0.17.0-darwin-arm64.tar.gz"
      sha256 "cbe14aa64f1c7ef192da64cc0186ccdc1caf709758829810c5e8be5693477e68"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.17.0/osprey-0.17.0-linux-x64.tar.gz"
    sha256 "0c498a69d9f31ea88ca1f6b2b23307952e40b5938611679204fadc7330ba845e"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.17.0", shell_output("#{bin}/osprey --version")
  end
end

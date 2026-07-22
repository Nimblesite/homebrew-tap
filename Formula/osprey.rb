# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.12.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/Nimblesite/osprey/releases/download/v0.12.0/osprey-0.12.0-darwin-arm64.tar.gz"
      sha256 "5937e0bc278c482aadec45b166f3f487981ed3bdd51ae5d451ddc7beb4d75b07"
    end
  end

  on_linux do
    url "https://github.com/Nimblesite/osprey/releases/download/v0.12.0/osprey-0.12.0-linux-x64.tar.gz"
    sha256 "67265449ede0ac17a4e615a548153ea8713e53de6f89c7fdf393bb01a155a845"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.12.0", shell_output("#{bin}/osprey --version")
  end
end

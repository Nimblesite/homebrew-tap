# typed: false
# frozen_string_literal: true
class Osprey < Formula
  desc "Osprey — a functional language with algebraic effects, fibers, and compile-time safety"
  homepage "https://ospreylang.dev"
  version "0.5.0"
  depends_on "llvm"

  on_macos do
    # Apple Silicon only — no Intel mac build (see release.yml matrix).
    on_arm do
      url "https://github.com/MelbourneDeveloper/osprey/releases/download/v0.5.0/osprey-0.5.0-darwin-arm64.tar.gz"
      sha256 "eba14170713497786522b96e5740bd05567cf980b5ab76c900e5bf03acb8a686"
    end
  end

  on_linux do
    url "https://github.com/MelbourneDeveloper/osprey/releases/download/v0.5.0/osprey-0.5.0-linux-x64.tar.gz"
    sha256 "6117f81e72cf3f6f723157231e46826b998756f231f8995a72306983cc987fe1"
  end

  def install
    bin.install "osprey"
    lib.install Dir["lib*.a"]
  end

  test do
    assert_match "osprey 0.5.0", shell_output("#{bin}/osprey --version")
  end
end

# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://github.com/Nimblesite/dart_mutant"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.3.0/dart_mutant-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b5cb8291638c449fd28c4f02174e0cf4377560725e5752de507ad71dbbe284f"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("\#{bin}/dart_mutant --version")
  end
end

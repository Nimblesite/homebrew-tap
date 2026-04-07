# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://github.com/Nimblesite/dart_mutant"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.2.0/dart_mutant-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9971c0feff12a94a4d1f5a1db2bbd49a1d1b71d8a4780fbe44328fc55287cff6"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("\#{bin}/dart_mutant --version")
  end
end

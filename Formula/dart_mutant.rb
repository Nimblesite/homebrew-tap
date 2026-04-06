# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://dartmutant.dev"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.1.0/dart_mutant-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1c9e99909d2cd1532f492cb53b7c9a5a09f5189309b06806ac3112f24a0c04f1"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("#{bin}/dart_mutant --version")
  end
end

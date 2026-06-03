# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://github.com/Nimblesite/dart_mutant"
  license "MIT"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.5.1/dart_mutant-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "d6d9e0c5aca17e84b9d14455b22dd6d47a4e2effe7d86a770775aa3ea1140794"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.5.1/dart_mutant-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7426df93ded5d898a7e748f85277242dd1428bde26f8b0e7d12483878ca6435"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("\#{bin}/dart_mutant --version")
  end
end

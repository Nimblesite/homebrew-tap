# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://github.com/Nimblesite/dart_mutant"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.4.0/dart_mutant-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "2cb8d6fb20b546284d9be65ada47649e73720544837f35804e6d23c54bbb2005"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.4.0/dart_mutant-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e4233f8355753e04e8dbb184b643eb6fbd794d8b141e8600199670e2997a0a7"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("\#{bin}/dart_mutant --version")
  end
end

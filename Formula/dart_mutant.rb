# typed: false
# frozen_string_literal: true

class DartMutant < Formula
  desc "Mutation testing tool for Dart using tree-sitter AST parsing"
  homepage "https://github.com/Nimblesite/dart_mutant"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.5.0/dart_mutant-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "c3e9dbb1c1e478d884ecab2e4efafd4cfb5622c788b1ea6e5f9f1e66f31cc0af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Nimblesite/dart_mutant/releases/download/v0.5.0/dart_mutant-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "664f606afe32c4acb441cfaa61fc564bd36630aa3da2e27029ea8d547b752055"
    end
  end

  def install
    bin.install "dart_mutant"
  end

  test do
    assert_match "dart_mutant", shell_output("#{bin}/dart_mutant --version")
  end
end

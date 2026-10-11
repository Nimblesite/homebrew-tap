# Commandeer Cloud's backend for this computer: acp-bridge starts its
# coding agents and conversation-host keeps their conversations.
# The release files are private: set HOMEBREW_GITHUB_API_TOKEN to a
# GitHub token that can read Nimblesite/acp_client before installing or upgrading.
class Commandeer < Formula
  def self.release_headers
    token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")
    headers = ["Accept: application/octet-stream"]
    headers << "Authorization: Bearer #{token}" unless token.empty?
    headers
  end

  desc "Backend that lets Commandeer Cloud reach this computer's coding agents"
  homepage "https://nimblesite.github.io/acp_client/"
  version "1.0.4"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/629568533", headers: release_headers
      sha256 "f2ea961b7a3d2579d6662ee499abaa553025e7fa8101fa032b9a2e8bc7da91c5"
    end
    on_intel do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/629568522", headers: release_headers
      sha256 "0bbd16a6599e5b9eb704b9ee31d19bc468bce7fae25d1cbd0dfaf0fa85f8f7dd"
    end
  end

  on_linux do
    url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/629568534", headers: release_headers
    sha256 "ede24cc23321432d35417caf7e25eb111b2f5d786960cbef2d06b8ff8bff0eef"
  end

  def install
    bin.install "acp-bridge", "conversation-host"
  end

  test do
    assert_match "1.0.4", shell_output("#{bin}/acp-bridge --version")
  end
end

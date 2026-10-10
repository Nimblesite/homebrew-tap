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
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/627752872", headers: release_headers
      sha256 "88a06f06dd6529ec7b139a3debb3d8d96edd0635730ff16905bc928966f9c3ac"
    end
    on_intel do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/627752870", headers: release_headers
      sha256 "001f7732a264f5fe6ee4f63115220e9124e9a3f21dd30864185278f6c6948dcb"
    end
  end

  on_linux do
    url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/627752877", headers: release_headers
    sha256 "134435059b8c11ee1fedad8294f8989889ad9a9ec77cffe3b845075927e92c48"
  end

  def install
    bin.install "acp-bridge", "conversation-host"
  end

  test do
    assert_match "1.0.3", shell_output("#{bin}/acp-bridge --version")
  end
end

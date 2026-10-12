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
  version "1.0.7"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/634065858", headers: release_headers
      sha256 "2af459e432fab137de4dadef48d7f9f79c8423fc4a8f82cd3a2fee8961de2de3"
    end
    on_intel do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/634065848", headers: release_headers
      sha256 "2a481d6f72d2961891e4e7395c1deaa78fbb1a7b90c69a383df2a3855b2aea6a"
    end
  end

  on_linux do
    url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/634065844", headers: release_headers
    sha256 "7e9a153a6a84514f0c3ae5577272983a269ab507410cfd4578296253e66a4f88"
  end

  def install
    bin.install "acp-bridge", "conversation-host"
    libexec.install "package/install.sh", "package/run-backend.sh"
    libexec.install "package/agent-runtime"
    chmod 0755, libexec/"install.sh"
    chmod 0755, libexec/"run-backend.sh"
    (bin/"commandeer-setup").write <<~SH
      #!/bin/sh
      # Configure this computer's backend, then start it with brew services.
      exec "#{opt_libexec}/install.sh" --bin "#{opt_bin}" --runtime "#{opt_libexec}/agent-runtime" --node "#{Formula['node'].opt_bin/'node'}" "$@"
    SH
    chmod 0755, bin/"commandeer-setup"
  end

  service do
    run [opt_libexec/"run-backend.sh", "--bin", opt_bin, "--runtime", opt_libexec/"agent-runtime", "--node", Formula["node"].opt_bin/"node"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    restart_delay 30
    # A service starts without the login shell's PATH: node and the
    # adapter runtime live in the package, and the agent harnesses
    # in the user's own folders.
    environment_variables PATH: "#{Formula["node"].opt_bin}:#{HOMEBREW_PREFIX}/bin:#{HOMEBREW_PREFIX}/sbin:#{Dir.home}/.local/bin:#{Dir.home}/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    log_path var/"log/commandeer.log"
    error_log_path var/"log/commandeer.log"
  end

  def caveats
    if OS.mac?
      broker = "#{Dir.home}/Library/Application Support/com.example.fleet/backend/broker"
    else
      data = ENV.fetch("XDG_DATA_HOME", "#{Dir.home}/.local/share")
      broker = "#{data}/fleet/broker"
    end
    <<~EOS
      Configure this computer's backend once, then start it:
        commandeer-setup --central https://<central>/ --supabase-url https://<project>.supabase.co --supabase-key <publishable key>
        brew services start commandeer
      commandeer-setup prints the same enrollment line with this computer's paths.
      State and sign-in live outside this package, so brew upgrade keeps them.
      Enroll this computer once, after commandeer-setup wrote host.json:
        #{opt_bin}/conversation-host login "#{broker}/host.json" "#{broker}/device.json"
        Add --github before the two files only when the central server has GitHub sign-in configured.
    EOS
  end

  test do
    assert_match "1.0.7", shell_output("#{bin}/acp-bridge --version")
    assert_predicate libexec/"run-backend.sh", :exist?
  end
end

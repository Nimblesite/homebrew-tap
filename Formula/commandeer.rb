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
  version "1.0.14"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/645478129", headers: release_headers
      sha256 "4dec2cd3c5bb89b08ba54d192d222bb1a9ac46b1b1a4ab66579eabba4aceaaa4"
    end
    on_intel do
      url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/645478124", headers: release_headers
      sha256 "cac7a2771cff8406273ae405a139b63957019bae1a3a320aa1dbf7ae98e140b8"
    end
  end

  on_linux do
    url "https://api.github.com/repos/Nimblesite/acp_client/releases/assets/645478126", headers: release_headers
    sha256 "64c80b6798d5c68400dae922d6b519d524cf5da3ca41228ca9fb1f9def8d50ed"
  end

  def install
    # On macOS both programs stay in their signed bundle and bin
    # links into it: macOS keys the owner's folder-access grant to
    # the bundle, so an upgrade keeps it. [FLEET-BACKEND-RELEASE-GRANT]
    if OS.mac?
      libexec.install "Commandeer Cloud Backend.app"
      bin.install_symlink libexec/"Commandeer Cloud Backend.app/Contents/MacOS/acp-bridge",
                          libexec/"Commandeer Cloud Backend.app/Contents/MacOS/conversation-host"
    else
      bin.install "acp-bridge", "conversation-host"
    end
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
    run ["/bin/bash", opt_libexec/"run-backend.sh", "--bin", opt_bin, "--runtime", opt_libexec/"agent-runtime", "--node", Formula["node"].opt_bin/"node"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    restart_delay 30
    # The system /bin/bash runs the runner, not Homebrew's versioned
    # bash its shebang would resolve to, which brew upgrade bash
    # would move out from under the service.
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
    assert_match "1.0.14", shell_output("#{bin}/acp-bridge --version")
    assert_predicate libexec/"run-backend.sh", :exist?
  end
end

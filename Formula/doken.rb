class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  version "0.7.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.1/doken-aarch64-apple-darwin.tar.xz"
      sha256 "bcdd43c6259596d539e0e66b031f2687b9912bc43e33761c1bc546c10464fb47"
    end
    if Hardware::CPU.intel?
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.1/doken-x86_64-apple-darwin.tar.xz"
      sha256 "43c0d729e68c45e3814314710219b09257c0a48849c3632a5b13d62390f9a255"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.1/doken-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0654dd470fd842d4ead94abe171cf407216389797c3011281f1b689cd7bdd712"
    end
  end

  BINARY_ALIASES = {"aarch64-apple-darwin": {}, "x86_64-apple-darwin": {}, "x86_64-pc-windows-gnu": {}, "x86_64-unknown-linux-gnu": {}, "x86_64-unknown-linux-musl-dynamic": {}, "x86_64-unknown-linux-musl-static": {}}

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "doken"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "doken"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "doken"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

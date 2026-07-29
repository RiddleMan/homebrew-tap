class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  version "0.10.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/RiddleMan/doken/releases/download/v0.10.0/doken-aarch64-apple-darwin.tar.xz"
      sha256 "46f9e6a7f1748d018ab2ea13d7a4ed48759f1a13cebe4f08cf982deba3dc9b95"
    end
    if Hardware::CPU.intel?
      url "https://github.com/RiddleMan/doken/releases/download/v0.10.0/doken-x86_64-apple-darwin.tar.xz"
      sha256 "97b37314de6eea210d6578ab8d53b30c5244cdf491afb869fcef5e61efd7b59b"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/RiddleMan/doken/releases/download/v0.10.0/doken-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "fb373222ca141785842b2b885d679ddd6048688cb64bad865483afe72f23e081"
  end

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

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
    bin.install "doken" if OS.mac? && Hardware::CPU.arm?
    bin.install "doken" if OS.mac? && Hardware::CPU.intel?
    bin.install "doken" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

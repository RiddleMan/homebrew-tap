class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  version "0.9.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/RiddleMan/doken/releases/download/v0.9.0/doken-aarch64-apple-darwin.tar.xz"
      sha256 "e749f5967cda685f8b14d511eeb44916ff62360340efd9ca5ddc909a15e09650"
    end
    if Hardware::CPU.intel?
      url "https://github.com/RiddleMan/doken/releases/download/v0.9.0/doken-x86_64-apple-darwin.tar.xz"
      sha256 "244a1b75a32e9b7ed906914183d147f2c4a0790790a83ff193adf5105269f734"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/RiddleMan/doken/releases/download/v0.9.0/doken-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d4717a24f54aa90b486cf8fc5672f466058d063e1c3c45fc2374582043639b25"
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

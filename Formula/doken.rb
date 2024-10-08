class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  version "0.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/RiddleMan/doken/releases/download/v0.8.0/doken-aarch64-apple-darwin.tar.xz"
      sha256 "2512893b68582b947290167c4c3ecb5c629b6afd98f45a0e3c696a6ac1dfc0cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/RiddleMan/doken/releases/download/v0.8.0/doken-x86_64-apple-darwin.tar.xz"
      sha256 "61352ba31e9ba5f1d7c983a73743a61532ed1980768f377a8c1bee2b31a0af8c"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/RiddleMan/doken/releases/download/v0.8.0/doken-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "713c0fdc352241152b0071c75edd7e91990321ea0c419e47fbd598e918fc71a5"
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

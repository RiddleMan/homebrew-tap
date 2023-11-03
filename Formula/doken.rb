class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  if Hardware::CPU.type == :arm
    url "https://github.com/RiddleMan/doken/releases/download/v0.6.0/doken-aarch64-apple-darwin.tar.xz"
    sha256 "1a00204a059b372ee504588170d4002530f501d4e1044536402780affde5ad2e"
  else
    url "https://github.com/RiddleMan/doken/releases/download/v0.6.0/doken-x86_64-apple-darwin.tar.xz"
    sha256 "11b34837f91929c0691d7b43b7c384916805cbd8a5cd86f03070ac154b8041cc"
  end
  version "0.6.0"

  def install
    bin.install "doken"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end

class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  version "0.6.2"
  on_macos do
    on_arm do
      url "https://github.com/RiddleMan/doken/releases/download/v0.6.2/doken-aarch64-apple-darwin.tar.xz"
      sha256 "bf11211533ad084db2b2a2f0af40d15dc6e1895a6688110ce65d36f9d8d50ecd"
    end
    on_intel do
      url "https://github.com/RiddleMan/doken/releases/download/v0.6.2/doken-x86_64-apple-darwin.tar.xz"
      sha256 "94ef643c2b0473a7625a782fe644c3ab8ad192477e97f11dc7a344d496f63768"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RiddleMan/doken/releases/download/v0.6.2/doken-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4ce3122e10baf4e9c0839e06565dc4ec90995e382f2f0cbc866c9f5fd23583a0"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "doken"
      end
    end
    on_macos do
      on_intel do
        bin.install "doken"
      end
    end
    on_linux do
      on_intel do
        bin.install "doken"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end

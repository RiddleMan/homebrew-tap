class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  version "0.7.0"
  on_macos do
    on_arm do
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.0/doken-aarch64-apple-darwin.tar.xz"
      sha256 "68bd4eef3b1c4d648c93a140065e1bbf44e5ec6302b9d50fe82c2b33055fec32"
    end
    on_intel do
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.0/doken-x86_64-apple-darwin.tar.xz"
      sha256 "fdce574d7762c1e6782175178fe8551d9764db30e78617a506bc5909dcd60b65"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/RiddleMan/doken/releases/download/v0.7.0/doken-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "703b1f874d3226fe16c9fa056d6da02896e6bf095ca56bff0efe616c3ef55673"
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

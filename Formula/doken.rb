class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  if Hardware::CPU.type == :arm
    url "https://github.com/RiddleMan/doken/releases/download/v0.5.0/doken-aarch64-apple-darwin.tar.xz"
    sha256 "aa36417de5c513828e33ec96b7f5447c57d8d3897e1546b1fde561771743f156"
  else
    url "https://github.com/RiddleMan/doken/releases/download/v0.5.0/doken-x86_64-apple-darwin.tar.xz"
    sha256 "3657a1da1b07c831cd8a07e3a9f169c567638565c0c45a887174f56261cbe552"
  end
  version "0.5.0"

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

class Doken < Formula
  desc "Tool for getting tokens from OAuth 2.0/OpenID Connect providers"
  if Hardware::CPU.type == :arm
    url "https://github.com/RiddleMan/doken/releases/download/v0.6.1/doken-aarch64-apple-darwin.tar.xz"
    sha256 "cf319a6394944bff2a2485b129bf426a11427f22079e3f098a79111ff19764e8"
  else
    url "https://github.com/RiddleMan/doken/releases/download/v0.6.1/doken-x86_64-apple-darwin.tar.xz"
    sha256 "25c8f6c832ec51aac278321395cfbe78621d6d2111ccafa125afb2cb34d11939"
  end
  version "0.6.1"

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

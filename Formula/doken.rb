class Doken < Formula
  desc "Tool for getting tokens from OAuth 2/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  url "https://github.com/RiddleMan/doken/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "e8b3c30393c8e392fb87f7bbb8c8e564acc4287620214de3889df88b3824d2ad"
  license any_of: ["MIT"]
  head "https://github.com/RiddleMan/doken.git", branch: "main"

  bottle do
    root_url "https://github.com/RiddleMan/homebrew-tap/releases/download/doken-0.4.1"
    sha256 cellar: :any_skip_relocation, ventura:      "447bac82f031f7c0824b7999a51591b665272e7525a459ac532e611e03b15883"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb6e29c813df3b77da59765dfb148a80d83237b576a5dc694a4aebef79a28708"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/doken --version")
    assert_match "doken 0.4.1", output
  end
end

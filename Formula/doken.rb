class Doken < Formula
  desc "Tool for getting tokens from OAuth 2/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  url "https://github.com/RiddleMan/doken/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "e8b3c30393c8e392fb87f7bbb8c8e564acc4287620214de3889df88b3824d2ad"
  license any_of: ["MIT"]
  head "https://github.com/RiddleMan/doken.git", branch: "main"

  bottle do
    root_url "https://github.com/RiddleMan/homebrew-tap/releases/download/doken-0.4.0"
    sha256 cellar: :any_skip_relocation, ventura:      "e4cb32dd6fddd63bf2f7863fb9ff3406962f626977f1e3ab378f1333dadc4bcf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b98db9300600e8738caf4a1c4b5da0b033d09ed55b430d9f44797cb74e92e19c"
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

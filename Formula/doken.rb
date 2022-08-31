class Doken < Formula
  desc "Tool for getting tokens from OAuth 2/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  url "https://github.com/RiddleMan/doken/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f862fd9d2b34f87437dbbcafa8f220dfeb2c9591d1cab729500f431de40217a0"
  license any_of: ["MIT"]
  head "https://github.com/RiddleMan/doken.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/doken --version")
    assert_match "doken 0.1.0", output
  end
end

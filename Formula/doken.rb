class Doken < Formula
  desc "Tool for getting tokens from OAuth 2/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  url "https://github.com/RiddleMan/doken/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5f923d9c64400b21471bb02591b59710532ac0b575d979da3cecf6198dddfb0a"
  license any_of: ["MIT"]
  head "https://github.com/RiddleMan/doken.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/doken --version")
    assert_match "doken 0.2.0", output
  end
end

class Doken < Formula
  desc "Tool for getting tokens from OAuth 2/OpenID Connect providers"
  homepage "https://github.com/RiddleMan/doken"
  url "https://github.com/RiddleMan/doken/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "17f17a524d8678b71582fac7e44cb706cf38e2e323b05940e13d70f3aa904df1"
  license any_of: ["MIT"]
  head "https://github.com/RiddleMan/doken.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/doken --version")
    assert_match "doken 0.4.0", output
  end
end

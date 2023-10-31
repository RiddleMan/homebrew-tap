class Doken < Formula
  desc "Tool for navigating through a history of branch checkouts"
  homepage "https://github.com/RiddleMan/git-branch-history"
  url "https://github.com/RiddleMan/git-branch-history/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c1add4ec407451463a74cdcbebb0cb7927b24ff9d84dfeed555fcfb3852d94c5"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/RiddleMan/git-branch-history.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/git-branch-history --version")
    assert_match "git-branch-history 0.1.0", output
  end
end

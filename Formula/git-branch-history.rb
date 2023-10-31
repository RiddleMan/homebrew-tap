class GitBranchHistory < Formula
  desc "Tool for navigating through a history of branch checkouts"
  homepage "https://github.com/RiddleMan/git-branch-history"
  url "https://github.com/RiddleMan/git-branch-history/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c1add4ec407451463a74cdcbebb0cb7927b24ff9d84dfeed555fcfb3852d94c5"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/RiddleMan/git-branch-history.git", branch: "main"

  bottle do
    root_url "https://github.com/RiddleMan/homebrew-tap/releases/download/git-branch-history-0.1.0"
    sha256 cellar: :any,                 ventura:      "d56c378304e72074f083209f99208e897ed311be89a217629562c8caef72f21e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2f07876409afd60a4536a4450d264d71b775fdb464d733661648f07bc0a2371"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/git-branch-history --version")
    assert_match "git-branch-history 0.1.0", output
  end
end

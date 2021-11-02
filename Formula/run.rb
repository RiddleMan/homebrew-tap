class Run < Formula
  desc "Utility to run scripts out of GitHub repositories"
  homepage "https://github.com/RiddleMan/run"
  url "https://github.com/RiddleMan/run/releases/download/v0.0.3/run-0.0.3.tar.gz"
  sha256 "279410ee7631af0c927652fc3f709f705f0bcd2f8110530b1e522d44b3066555"
  license "MIT"

  def install
    prefix.install "run.sh"
  end

  test do
    system "true"
  end
end

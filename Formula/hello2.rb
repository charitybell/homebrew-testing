class Hello2 < Formula
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be774eec52b99eca3c6e74d3e754bfef082c65509cccedae2b743e31410c14aa"
  end

  depends_on "gcc" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build
  depends_on "ffmpeg"

  def install
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

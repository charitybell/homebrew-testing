class Hello < Formula
  revision 74
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "d6a6112de677803cd90790024f1cecc49a9af0b56c9847b29f4a0e4582ffc5a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "15e6f83d4fbe1615fd2a90399087189011c5c2d105038177abe25a1ac26c3cc6"
  end

  depends_on "gcc" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build
  depends_on "ffmpeg"

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

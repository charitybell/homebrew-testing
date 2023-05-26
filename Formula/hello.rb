class Hello < Formula
  revision 72
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "001631773b58316e7c60d178a07b8e945e55328a2ba864fb21f7bd0f22b47e33"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c8959fc98d735b9495d1b03c3fa94cc61765f0821b915982932a3d2b1cbf619c"
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

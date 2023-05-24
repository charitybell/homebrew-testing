class Hello < Formula
  revision 16
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c752d694cb6bbf34882c25b281bead93c20aa7614c6d6a0b9508f1ee36027380"
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

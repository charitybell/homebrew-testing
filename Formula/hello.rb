class Hello < Formula
  revision 76
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "fc2fd5d0567e2bfd66cb6589511ea495221039f6eab1f5435901ff69c417627e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "533037c03a60026ba4fcf83830799c78d79c4908f660911c375bc52db4075dc7"
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

class Hello < Formula
  revision 66
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "e77ed9d06c9a8f719ed6ed5962d9865493ececdc388db42f36aceb90c48fe3db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7dd428204b749b8ede98c43be96c3a3f24cf36997fbdf09c6fb9f0454e86107e"
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

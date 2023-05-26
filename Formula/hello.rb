class Hello < Formula
  revision 78
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "5b65d4c2a3a5a1fdd8b6dc328ec9cc4b95e2f08315c2dc6141de696d775f10dc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9efd62685ee7f5a3cb39f6b7aea09df093ae31bcd43aeecef34ed8b9236c0195"
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

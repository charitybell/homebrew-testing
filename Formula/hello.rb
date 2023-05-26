class Hello < Formula
  revision 78
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "d3df9a7a3e1475df535aec12be2083ebd9a547bb6ca3f4d6f9b86a27236e9c4f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b79b9576f86c091055f1be4b17c55ed575341dc03c4a9063000be282fedb4f74"
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

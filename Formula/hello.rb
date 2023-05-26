class Hello < Formula
  revision 62
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "a2fdcfd0416efcb5dfb98ff0744a170bffd96afea8e91f278f90fb548a6a3bcc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58d3755a68a5b60dd8b7f091ee3d4e6c8e364f5d8f646618ea2cfe38ab604238"
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

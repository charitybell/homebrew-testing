class Hello < Formula
  revision 67
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "1fcf193d5413fb6457abfdc3d511bc7732dd9e5ebb1fb34fe09d81874bd0af61"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f041a3f4092e2d8d294b1353d0d2d628c6cc7edc2e70b76a5fb35aa7767f24a"
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

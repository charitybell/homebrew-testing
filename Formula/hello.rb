class Hello < Formula
  revision 71
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "494207b40b5c7bf83fa48b02aa4f6d72a6c1242ddada814eb77181e9b0d23c38"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9cf56c2d4370a33722d771d0b69dfd68bbc244a5697495d2ef11b6e654df808"
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

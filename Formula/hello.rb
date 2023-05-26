class Hello < Formula
  revision 68
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "fb463d0a0e6547f7f7c962fc1776efe112b3a1aa4ca0a80bd9b7370fc880a51b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "37daf579fdc38eaa9074743498d8fe92f86ec7181740cce846f3ae6cd48d4caa"
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

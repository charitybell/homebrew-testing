class Hello < Formula
  revision 70
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "bf1e555c29e1f81d18ebee431d3011c5f4e9d8f07ba1bdce7133f852a9b3fee3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9aa627c3a0b89a8ad7d5ee00f7f115f8d32e7b3a73371e9443c8c9c39d845ae8"
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

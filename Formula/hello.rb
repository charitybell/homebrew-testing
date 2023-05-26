class Hello < Formula
  revision 65
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "d882f464578446519d093a35642194910a204830fc0daac2e0e76884c31c38d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "04b9885e70a03a9923cba1149982b781d3987e8d04e618ee4499846d17ca3dd4"
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

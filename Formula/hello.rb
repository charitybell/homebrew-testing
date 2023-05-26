class Hello < Formula
  revision 73
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "79c8b4c79858e9b6d1317f2b8a8ebd4efec32eaa9420b542dfa16fdf19c64e0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0458bea20a9cc5de68acc8ab6c55f7e497c44f91e1d8171ca16975dc01e5a48"
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

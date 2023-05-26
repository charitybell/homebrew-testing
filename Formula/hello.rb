class Hello < Formula
  revision 61
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "18ad5866d08f91ea74f1e936567ea76351585f1e7bbd257f4d1240737e684cb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dde7a6a6d57bf2b74455fc571316e25da14f7d49a70c753bdd2d07404faeac9d"
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

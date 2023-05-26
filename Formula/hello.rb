class Hello < Formula
  revision 69
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "af287931b58f220821cb40700e146329d2595f45dcc48027a041c8b4cb9b6583"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a9e0791d08bebb546c1c3409134daaedb103c4eb48a2e275af95c6a2cdc5114c"
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

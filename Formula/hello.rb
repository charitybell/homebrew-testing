class Hello < Formula
  revision 90
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "44055b908b4d08fd4be681b265358d1816ec2d99eabad12168e055ac820e0ffb"
    sha256 cellar: :any,                 monterey:     "33828c991db15683f58b4b829426cea78726f8874edd031e265c29191f62bc15"
    sha256 cellar: :any,                 big_sur:      "f556346220aae428d6bddb85e3d93918d6a62372820881588143538f97c6f344"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc7c45228041ec7d1bad1c99d3355b892e7aebc481675f8268575511f04311c5"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

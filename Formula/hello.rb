class Hello < Formula
  revision 95
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "3d89c31821b20c95f957a71435be78717b0a533def1fe5324ab0de62384de60d"
    sha256 cellar: :any,                 monterey:     "4427f096eda2015fab06423810b136c5bc1ac489a2e5f2ae050113c2d7c2fffb"
    sha256 cellar: :any,                 big_sur:      "a4a807d7bc3e63710cabbaba39c3b8cb91a075cec963382caa9f0754d130ad00"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6833b9dd9d75e591d4defc05cfc97fe7f58cd2e6b1c609ee6d3a147e9673536"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

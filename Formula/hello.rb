class Hello < Formula
  revision 7
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  depends_on "gcc" => :build

  def install
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

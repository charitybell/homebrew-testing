class Hello < Formula
  revision 81
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "ad16eb05af389cc244b7d51f1bc65abbc5d06e3c065f5a469b66f4a772e10ca3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "25caaa6548883f7c0edd2f5b2515464bd7b51492160023f2626a708a5e3ba509"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

class Hello2 < Formula
  revision 8
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "1be0887a62292c17243cdda11e397f8b0750408ff6de6d775ca1a0e48f64a4e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ad3c53ab1d16a9bb35ac828052be76cdc2ecbc65298cd2c0c1be6a1cf7ce9d35"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

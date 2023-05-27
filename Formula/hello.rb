class Hello < Formula
  revision 88
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "97310ce0b7595acb3499526f7d6a9a5192a27ce0e0e51fe2ee00cf5d42572c36"
    sha256 cellar: :any,                 monterey:     "754c5ba57c0124242a3d84934ef49bd1c7f31a8a57c9f8fcf8b774fde77788ab"
    sha256 cellar: :any,                 big_sur:      "3bbbf3f9c893d986c1dabec5692323d4b96a16b106727da377ab5faac74534b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8729bf4f2a440ca1213548ecbe985390856e4545ee7967c24b12684516202cb"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

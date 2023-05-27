class Hello2 < Formula
  revision 8
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "9d323f0e0881e0c96745813888f0032a306e7f510014213ab91c2b208763c8fa"
    sha256 cellar: :any,                 monterey:     "3a54ca71738643f221dbd5558ed451cc7f3447c01e5e3474f5597ca7ea1b0fa7"
    sha256 cellar: :any,                 big_sur:      "c0f4dc85900be6aa27a520d09da2c64b92c4bbd3fe92675a6b9131898225e073"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "77b2ba1c75bc527c9f6c571e5dcda2984e35d020af1220c633716bd715c8a02e"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

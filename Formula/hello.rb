class Hello < Formula
  revision 93
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "11465392da24206321944b1dab1403033a562fcb7b4b5bc5fb1a4c7a757e92d7"
    sha256 cellar: :any,                 monterey:     "89e58e44bc5af6681ab448cfe07fbc4c60ccb3a2c1342ab438619aa0ff017e7d"
    sha256 cellar: :any,                 big_sur:      "a825c0274b4d87bf700445d8bccfec0187912f5127fab39df0094997ec624079"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "75da8a30bd4e42f1e5307c785d340fd072bb7fb392405a48bd467be32a31888f"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

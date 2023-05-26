class Hello < Formula
  revision 76
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "25a025d22cecffd5a7a14ad92ec0c02b058ab39ce4be4e8a0670e69339a95ac1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93eca601993b6e7b51b68c8e09af7bb928a862d0c30ee89ef9689d63bbfcbfed"
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

class Hello < Formula
  revision 79
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 monterey:     "e8f117f8bc5b15e84ac670d8899b68d429b92a86f63b8bd18630f1a43fab6517"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c7936c3eec4e4aa4d98665553cb57469a77cab8e7ea6fe76fbe943406a35dc62"
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

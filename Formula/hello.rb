class Hello < Formula
  revision 98
  desc "gnu hello"
  homepage "homepage"
  url "https://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz"
  sha256 "cf04af86dc085268c5f4470fbae49b18afbc221b78096aab842d934a76bad0ab"
  license "AGPL-3.0-only"

  bottle do
    sha256 cellar: :any,                 ventura:      "0a392391f9eb84b1a638aa6a59b9c75b5c3d461047a88d0a6c09fdf83a5b932a"
    sha256 cellar: :any,                 monterey:     "50243d316061caabac28c26fdbb6091f599a98848ac495d0c3e13d9e31028cb0"
    sha256 cellar: :any,                 big_sur:      "09a57aeca71c751f8e926c0b61731063ea614a168e3564588edebf5d3989260e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4e8ff2f2f5d949e0fa4d470b64bd543126ac44b640e4c08475ff764c44269a48"
  end

  depends_on "gcc" => :build unless OS.mac?

  def install
    ENV.append "LDFLAGS", "-liconv" if OS.mac?
    system "./configure"
    system "make"

    bin.install "hello"
  end
end

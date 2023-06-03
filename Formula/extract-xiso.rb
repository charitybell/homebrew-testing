class ExtractXiso < Formula
  desc "Xbox ISO Creation/Extraction utility"
  homepage "https://github.com/XboxDev/extract-xiso"
  url "https://github.com/XboxDev/extract-xiso/archive/refs/tags/build-202303040307.tar.gz"
  sha256 "6b40a0114fb9f79d9e75a4d6c80efce68e2cb0da3e93fe575ea2c7e30aa5ed57"
  license "BSD-4-Clause"
  revision 1
  head "https://github.com/XboxDev/extract-xiso.git", branch: "master"

  bottle do
    root_url "https://github.com/charitybell/homebrew-charitybell/releases/download/extract-xiso/"
    sha256 cellar: :any_skip_relocation, ventura:      "a012bd1479c45ba6504df64eceb920188cba9b258b92787a6d99b4cfab5eb2b0"
    sha256 cellar: :any_skip_relocation, monterey:     "03973c21a32b8897fc8fb320e20401a52f22a8e9e959499d2523bbdd49365328"
    sha256 cellar: :any_skip_relocation, big_sur:      "1e84dd41ae7d8d948e4b38084fa70b8e1d3499b91d80a5b9a569ef41ca214259"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e99d4e5312b796eaf482a00cce282711d6113a94c51e1436b18cd16c7baa683e"
  end

  depends_on "cmake" => :build
  if OS.mac?
    depends_on xcode: :build
  else
    depends_on "gcc" => :build
    depends_on "make" => :build
  end

  def install
    Dir.mkdir "build"
    Dir.chdir("build") do
      system "cmake", ".."
      system "make"
      bin.install "extract-xiso"
    end
  end

  test do
    system "#{bin}/extract-xiso", "-h"
  end
end

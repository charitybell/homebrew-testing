class Hexchat < Formula
  desc "GTK+ IRC client"
  homepage "https://hexchat.github.io"
  url "https://github.com/hexchat/hexchat/archive/refs/tags/v2.16.1.tar.gz"
  sha256 "f15bc487312a96a902e042e8f197a8494a29bcf4a00bbfd276a5e8154263bfe5"
  license "GPL-2.0-or-later"
  head "https://github.com/hexchat/hexchat.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "cffi"
  depends_on "dbus-glib"
  depends_on "glib"
  depends_on "gtk+"
  depends_on "iso-codes"
  depends_on "libcanberra"
  depends_on "luajit"
  depends_on "openssl"
  depends_on "perl"

  def install
    Dir.mkdir "build"
    chdir "build" do
      system "meson", ".."
      system "ninja"
      cp "src/fe-gtk/hexchat", "."
      bin.install "src/fe-gtk/hexchat"
      man.install "../data/man"
    end
  end

  test do
    system "#{bin}/hexchat", "--help"
  end
end

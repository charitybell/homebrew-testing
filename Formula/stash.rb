class Stash < Formula
  desc "Organizer for your porn, written in Go"
  homepage "https://github.com/stashapp/stash"
  url "https://github.com/stashapp/stash/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "f52115d19d4e45ff9fb0cd8a1ee4e2d467bcfd51cad58db1ed9d34e135e78132"
  license "AGPL-3.0-only"
  head "https://github.com/stashapp/stash.git", branch: "develop"

  depends_on "gcc" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build
  depends_on "ffmpeg"

  service do
    run [bin/"stash"]
    keep_alive crashed: true
  end

  def install
    ENV.deparallelize
    system "make"

    bin.install "stash"
  end

  test do
    system "#{bin}/stash", "--help"
  end
end

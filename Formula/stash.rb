class Stash < Formula
  desc "Organizer for your porn, written in Go"
  homepage "https://github.com/stashapp/stash"
  url "https://github.com/stashapp/stash/archive/refs/tags/v0.20.1.tar.gz"
  sha256 "55afac710bfa76de10c77da82534344075ec9ab6ee8de237449293321a24fd18"
  license "AGPL-3.0-only"

  depends_on "gcc" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build
  depends_on "ffmpeg"

  def install
    ENV.deparallelize
    system "make"

    bin.install "stash"
  end
end

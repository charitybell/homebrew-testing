class Stash < Formula
  revision 4
  desc "Organizer for your porn, written in Go"
  homepage "https://github.com/stashapp/stash"
  url "https://github.com/stashapp/stash/archive/refs/tags/v0.20.2.tar.gz"
  sha256 "1eaef744ce856afe71857381fb832c29fc0c43eefc6336c60c30be36b929c71b"
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

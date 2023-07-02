class Stash < Formula
  desc "Organizer for your porn, written in Go"
  homepage "https://github.com/stashapp/stash"
  url "https://github.com/stashapp/stash/archive/refs/tags/v0.20.2.tar.gz"
  sha256 "1eaef744ce856afe71857381fb832c29fc0c43eefc6336c60c30be36b929c71b"
  license "AGPL-3.0-only"
  head "https://github.com/stashapp/stash.git", branch: "develop"
  revision 1

  bottle do
    sha256 cellar: :any_skip_relocation, ventura:      "5e31dc24ebca94c767303fa82410a83f0236c95778ae87e01a49f57a18a2e7ae"
    sha256 cellar: :any_skip_relocation, monterey:     "75d1343c87a255e8c4f163ff5786a425e9c1942aecb12f0a3bd8bb4c77a1b349"
    sha256 cellar: :any_skip_relocation, big_sur:      "14b8dbadeedf6e42c72f44437371e77add40c92f1b681262352b7d0be19408b8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aec3ced5d94cd21291f8e622555f042eedc42ce82808600d8965f7909f79d09a"
  end

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

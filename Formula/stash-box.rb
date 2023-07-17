class StashBox < Formula
  desc "OpenSource video indexing and Perceptual Hashing MetaData API"
  homepage "https://github.com/stashapp/stash-box"
  url "https://github.com/stashapp/stash-box/archive/refs/tags/v0.4.7.tar.gz"
  sha256 "76865ac41b5d4bdbbdba8c2035af57938bd769b62f1000dfc065ee4f3c3a3008"
  license "MIT"
  head "https://github.com/stashapp/stash-box.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, ventura:      "568e6f872e8e00665bd8ab654683afa78e01874a8050cfad914f666b2bbaeb9e"
    sha256 cellar: :any_skip_relocation, monterey:     "9cab9cc84a2b58cb274c2efd28f62802d48a0222124be6ff9fbb418cbbc26a86"
    sha256 cellar: :any_skip_relocation, big_sur:      "3aec86314b8f69a6aa5ddb632bb24aa7c31f830b5b6cb0251f58d47d770ce606"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c594d4aa409b4471e5ef35b8c5c6173ad564125a364d90d2bef5a21bae3b2978"
  end

  depends_on "gcc" => :build
  depends_on "go" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build
  depends_on "postgresql@15"

  def install
    ENV.deparallelize
    system "make"

    bin.install "stash-box"
  end
end

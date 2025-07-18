class GoogleSparsehash < Formula
  desc "Extremely memory-efficient hash_map implementation"
  homepage "https://github.com/sparsehash/sparsehash"
  url "https://github.com/sparsehash/sparsehash/archive/refs/tags/sparsehash-2.0.4.tar.gz"
  sha256 "8cd1a95827dfd8270927894eb77f62b4087735cbede953884647f16c521c7e58"
  license "BSD-3-Clause"
  head "https://github.com/sparsehash/sparsehash.git", branch: "master"

  no_autobump! because: :requires_manual_review

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "172ff956a189cea419801e2ce07c5fd7c80f1e7a2372d1c02270a392e272204c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5fe99f9acb9ab292d249f8c1bc05382687e8a24399447f135f707da6f402ef11"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "18714795cfeeeaed655d978a981e4c831fe39e46743ed79c0c219c695cf281e3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1cee10f1f45f9aa17c0a63573fb8065dea21f9f79c075fafeee699649d50f28d"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "f24d74610bacd7a53f950e58f03b6d674d43a15495973d09c006e44e6721fde8"
    sha256 cellar: :any_skip_relocation, sonoma:         "3605d3f5af374d00a680d80b7d14922cc982bc3857579c7be4d847adf201011a"
    sha256 cellar: :any_skip_relocation, ventura:        "f9a98e3b018a0dfa4082ea14e434c6ad4f04465dd9a401f20b4de2c7e5dfc4fc"
    sha256 cellar: :any_skip_relocation, monterey:       "748df13f800d3d41d0c5c27f63cc349564b26029ba23659157f638e6753bfba1"
    sha256 cellar: :any_skip_relocation, big_sur:        "530dad7aa78d4420bbcbe5dbd6ab1a634acbc29a22576f19ec31af556ed4332c"
    sha256 cellar: :any_skip_relocation, catalina:       "11390608ee72647c06a9735f89535604e6ed2b2531431f9eb81bdf423ab07620"
    sha256 cellar: :any_skip_relocation, mojave:         "11390608ee72647c06a9735f89535604e6ed2b2531431f9eb81bdf423ab07620"
    sha256 cellar: :any_skip_relocation, high_sierra:    "11390608ee72647c06a9735f89535604e6ed2b2531431f9eb81bdf423ab07620"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "236ba9065faa0a1442555222607dce1cb1e12d0b40978749c63b5c39c53d1484"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "dc2afe1af778fc2217f2bc84ab4e38d0cdd96420ac08e4f9e909fa07e83efbdb"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "check"
    system "make", "install"
  end
end

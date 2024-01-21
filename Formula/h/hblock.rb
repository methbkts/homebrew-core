class Hblock < Formula
  desc "Adblocker that creates a hosts file from multiple sources"
  homepage "https://hblock.molinero.dev/"
  url "https://github.com/hectorm/hblock/archive/refs/tags/v3.4.3.tar.gz"
  sha256 "13cf24f2e72694cdd0ddac51a8b253f707c2da63462f8b53ab26de9675cd87d8"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "49a7f650761fea0f964bc4542c745ebf4ee80325f18e1c666c352fd36a9b03ee"
  end

  uses_from_macos "curl"

  def install
    system "make", "install", "prefix=#{prefix}", "bindir=#{bin}", "mandir=#{man}"
  end

  test do
    output = shell_output("#{bin}/hblock -H none -F none -S none -A none -D none -qO-")
    assert_match "Blocked domains:", output
  end
end

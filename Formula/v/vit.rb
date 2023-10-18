class Vit < Formula
  include Language::Python::Virtualenv

  desc "Full-screen terminal interface for Taskwarrior"
  homepage "https://taskwarrior.org/news/news.20140406.html"
  url "https://files.pythonhosted.org/packages/a2/24/71ef618e17ced54d3ad706215165ebeb6ebc86f5d71ded58c4dbcba62b83/vit-2.3.2.tar.gz"
  sha256 "a837d8e865a70d0e384a1e78d314330f000d108fa62e3a72d9aec6dec7ca233c"
  license "MIT"
  head "https://github.com/vit-project/vit.git", branch: "2.x"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "d38736df8b5676a6c0984435b4bd78c04016db160a1ca455fbc06963bbc417ea"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "2cdf3ef7fa6362fc0ebd0e03bc21ec85ffcb4a82d7ff008c46e1f03c1a97e4a4"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "da829044a95cabaa0cad05832056934cec40bef04745935aa66b395fb98091fb"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "0f45d5c5e30b1d047a720e35a74447cb454c3fa826378a3995b6bf84b5cae36c"
    sha256 cellar: :any_skip_relocation, sonoma:         "21e4284bcad1dbb1f6105f6f057d734c00f72eabce2677f9f655364a493b295e"
    sha256 cellar: :any_skip_relocation, ventura:        "7c7e2f9e250a1fe594ea3d138fedb3381e44d6b3ade8a891a1422497f072e4c2"
    sha256 cellar: :any_skip_relocation, monterey:       "92ec92eb9624dd50724a5fb76f91b9fac8bcc4290044e7f9ab0ef53d00490aec"
    sha256 cellar: :any_skip_relocation, big_sur:        "fcc8009bd7c477231ca8f8d3b879d1313f86fc32653319145fd3e63b86ea7dad"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2f93e4ff9a53c040bd12353b27506070548a1f286da040a30969dc67ee386b7d"
  end

  depends_on "python@3.12"
  depends_on "task"

  resource "tasklib" do
    url "https://files.pythonhosted.org/packages/3e/50/3e876f39e31bad8783fd3fe117577cbf1dde836e161f8446631bde71aeb4/tasklib-2.5.1.tar.gz"
    sha256 "5ccd731b52636dd10457a8b8d858cb0d026ffaab1e3e751baf791bf803e37d7b"
  end

  resource "urwid" do
    url "https://files.pythonhosted.org/packages/5f/cf/2f01d2231e7fb52bd8190954b6165c89baa17e713c690bdb2dfea1dcd25d/urwid-2.2.2.tar.gz"
    sha256 "5f83b241c1cbf3ec6c4b8c6b908127e0c9ad7481c5d3145639524157fc4e1744"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/".vit").mkpath
    touch testpath/".vit/config.ini"
    touch testpath/".taskrc"

    require "pty"
    PTY.spawn(bin/"vit") do |_stdout, _stdin, pid|
      sleep 3
      Process.kill "TERM", pid
    end
    assert_predicate testpath/".task", :exist?
  end
end

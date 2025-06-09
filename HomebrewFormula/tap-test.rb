# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class TapTest < Formula
  desc "Testing tap"
  homepage "https://github.com/bepaald/tap-test"
  license "GPL-3.0-or-later"
  head "https://github.com/bepaald/tap-test.git", branch: "main"

  depends_on "cmake" =>:build
  depends_on "openssl@3"

  def install
    system "cmake", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    bin.install "build/tap-test"
  end

  test do
    # not a 'good' test, but not sure what else is possible here
    `#{bin}/tap-test --help`
    result=$?.success?
    assert *result
  end
end

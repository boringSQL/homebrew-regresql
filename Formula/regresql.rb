class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringsql/regresql/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e98f712ac019e9d9a71ffc760be0dc67472ac6a460e04a25c941fca22302be21"
  license "PostgreSQL"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version 2>&1", 1)
  end
end

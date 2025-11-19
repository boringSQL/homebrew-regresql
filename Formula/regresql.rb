class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringsql/regresql/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "086d10d0c61c6716e2630a8e93bb267acd2437f9c0d26dcd75d89c992f6439fc"
  license "PostgreSQL"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version 2>&1", 1)
  end
end

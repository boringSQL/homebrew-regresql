class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringSQL/regresql/archive/refs/tags/v2.0.0-alpha2.tar.gz"
  sha256 "08de9d6b61cbd9d6201a835cad526418dbea83d6d6fadef5e6c2d8f82c0a859f"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/regresql/cmd.version=#{version}")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version")
  end
end

class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringsql/regresql/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "1c73231773e0e83a1486e3d8a47e49a07501705fdf8f27c1d2bbf067eb82519c"
  license "PostgreSQL"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/regresql/cmd.version=#{version}")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version")
  end
end

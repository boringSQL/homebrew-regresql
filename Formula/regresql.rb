class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringsql/regresql/archive/refs/tags/v1.2.5.tar.gz"
  sha256 "a2ea3c9c14e6b3d5af54b3e6709709c6899d8ed9411698cd054c6d9d87f989f9"
  license "PostgreSQL"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/regresql/cmd.version=#{version}")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version")
  end
end

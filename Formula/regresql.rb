class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringSQL/regresql/archive/refs/tags/v2.0.0-alpha4.tar.gz"
  sha256 "7727806f28d96700ad2653f168d133adeec02e48c41de7dc23a005ad4593da39"
  license "BSD-2-Clause"

  deprecate! date: "2026-02-17", because: "has moved to the boringsql/boringsql tap. Run: brew untap boringsql/regresql && brew tap boringsql/boringsql"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/regresql/cmd.version=#{version}")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version")
  end
end

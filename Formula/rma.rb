class Rma < Formula
  desc "Ultra-fast code intelligence and security analysis for Rust monorepos"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.1.1/rma-aarch64-apple-darwin.tar.gz"
      sha256 "c7c10cd54ff4fa889a924a1ca6f20d2d1033669789e8d7cdb072070414d1cdb8"
    else
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.1.1/rma-x86_64-apple-darwin.tar.gz"
      sha256 "c2ff69f9ae3cd951b12fca5202a7068e0df03c4b427b752e39bc0def8c4f9391"
    end
  end

  def install
    bin.install "rma"
  end

  test do
    assert_match "rma", shell_output("#{bin}/rma --version")
  end
end

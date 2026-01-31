class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.3.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "68598347475b0fd5787b485342e36a8cdc6e6e661659ae572976e35cd5b7e7bf"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.3.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "2f84d9068598cb5cb59b37c0271e24bc84cf2c9699d0e951b10beb5e88bf605b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.3.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3210e01fe17fc91d6e09cb51cef58f17d76b63d9f9d744a6c06983fbff116f0f"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.3.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25732653a42978eac3e7ffb005325b3bbd5f4b1377939ed36d641fdafc7a4e2f"
    end
  end

  def install
    bin.install "rma"
    generate_completions_from_executable(bin/"rma", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rma --version")

    # Test scanning a simple Rust file
    (testpath/"test.rs").write('fn main() { println!("hello"); }')
    output = shell_output("#{bin}/rma scan #{testpath} --format json 2>&1")
    assert_match "findings", output
  end
end

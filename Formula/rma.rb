class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.18.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.2/rma-aarch64-apple-darwin.tar.gz"
      sha256 "26d3299e3df19641ff1d8b44d6310f48dde242a89041a0ad67d49a6234bae6cd"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.2/rma-x86_64-apple-darwin.tar.gz"
      sha256 "eeddbed93b39d724d770d50db2d3529ba8005394b3191fcbe00712a560d8d5f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.2/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b0e5c22d41e72f21b7bbf4a8e2cb78f78f3c4d81632ea450a91cec88dfd2b85"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.2/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e4ca89cec1b952ac9ce830f8d37770d29e2796aa5a9dc9352e2e38de1edd8de"
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

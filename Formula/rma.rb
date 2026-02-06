class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.18.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.1/rma-aarch64-apple-darwin.tar.gz"
      sha256 "1ee76af7c533844de06bfc6333c1b6e01a8a042a3815f090992c650b099fee18"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.1/rma-x86_64-apple-darwin.tar.gz"
      sha256 "331da6204e811484d257890f6897abe437ce2cd4e63e333ce23133b20c8c44dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.1/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ded0f19de95e585439991cbdd4f63f3f73ad3d28c5aefc7a7183a9cd03b21e6d"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.18.1/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28a046ffa6b3ea2c7e4669fea0c76aa185b4f96076b8ffe3e391e313dda666ad"
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

class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.7.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "847c32567e23e0eb8c372c25b371a71244a5dc6abec6633499fe94ad46c2c5e9"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.7.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "34a673586d0e76e010526fe4d0d5714dd348dc3cf2c817d795f9978c842927e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.7.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82134ad8cd76002b6a5f8e53c65c43eb84d6aaba107e493907ed70cd28b53411"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.7.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54bdb4f55579d5002e080ae53c7d5ffa4697c618493fca8f19676fe23f47eac2"
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

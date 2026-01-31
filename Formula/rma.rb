class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.6.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "23598ee5eeb247e0248c96ad02b15f0e7b074330b0417dc7af3338f98f79027f"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.6.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "9537755b28cd33b529e134018ddfbdcebf7a134e1fb5ee7cc3a79001f0db861b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.6.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "590be2f283e9d8cfb869232e43446fb294b0085fd1c4a86ebedae9979cad522e"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.6.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c44ea0f43358c14cf27251d534951f96bb7107fdde35401a4afdd8e0a6a5af47"
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

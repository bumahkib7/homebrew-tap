class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "a62273391e7974e3e652f467f794a12fb2835aa37cfd0590331b12348f7d6822"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "ce6b5f20e20eca5c4cdffe5b088f6eef13633c3b75f28aac96d8e97c94920bb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4cb8c5a76b5a87fd19067b2cf453609398e023e4d451ab8f05a4ac6eb3a224f"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "430b5014abbd70790c4a3560144bcd7a1dd5144e5e839992bc792328a0bc6bff"
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

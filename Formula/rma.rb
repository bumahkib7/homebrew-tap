class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.5.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "82951fec8b239ee6ac58d35deab48e006269d8185811e743cc4ac78d8a592e2f"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.5.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "047446280cd8cbe8afc61158faf60b03b18493844b398015e0c3c1117a2babe2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.5.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1988b1fcefcf191d13c4612fc4165e5ce1ae5e234c4181ad2014ddb7a6f070b1"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.5.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3c7dd79082b706ccda204061bf506ebffc7216b4cd362513dbef8eecaaa63c5"
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

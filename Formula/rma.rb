class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.2/rma-aarch64-apple-darwin.tar.gz"
      sha256 "15046e43747bc32fc306688aafe74fd3b7703f23043d2fb496ece6ba3743b317"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.2/rma-x86_64-apple-darwin.tar.gz"
      sha256 "fa9f985e420ab711d4075800db838f164996301c3f258efe9eeea2b3bea46399"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.2/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e355eecac91745b884b540ee2c536a8056f7b57fdcca9c8f346afba947a9018"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.4.2/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95672c7ccb21f14e4a165c5e3b1492b24d1db96c13335a63be80532d334325ce"
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

class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.8.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "a2a9159a83a35405151bedd7ae4883963d4c5c64d955db9c628a82e7fd5df481"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.8.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "cac60b2268e9394b37a9195b6082bd6995fa182a034c4d0680b5fbfbe01a26a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.8.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8f8bffd75fbdfb9f57bd3b2697269fe4720d2d74d35d03dfb3d18043f07148a"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.8.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "775875e4d1e4d29642ae875b21038e02f4e787699c103d8c36409982692423a4"
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

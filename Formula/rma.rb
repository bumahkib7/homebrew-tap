class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.19.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.19.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "8d162d54a8054d5ff9bb428d420d10063c26e52c6c641458019a57f32497c071"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.19.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "a5100214485ac0156d6968fb99e501642b6aa86823124ab74ed6b8f21822f714"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.19.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72ef48795332c4b9e3e24ba784652be1a8095f4f61cdb382dc3db6c3e4eb4e3a"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.19.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd33f72ec171ca2d73c2aba3e7277ac7c5b30f6959b36c1bb6c8f17b9753b264"
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

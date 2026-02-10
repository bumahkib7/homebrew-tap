class Qryon < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/qryon"
  version "0.20.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.0/qryon-aarch64-apple-darwin.tar.gz"
      sha256 "a28cd476f9918abe9c1441434ab7e175d1e9201ac31a4e1a0ca730744f332f64"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.0/qryon-x86_64-apple-darwin.tar.gz"
      sha256 "ef960a628886c42e159ed4577652e09cc5b34297143e9666aa0ab11418244809"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.0/qryon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73ea545687f5b2179d9a96d15f10630a25eaecd03c918a33b5add478fcb844a0"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.0/qryon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6717d525265225bae43e5d7931f463ee81fc2105221c48a69e14e1bbb7d71335"
    end
  end

  def install
    bin.install "qryon"
    generate_completions_from_executable(bin/"qryon", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qryon --version")

    # Test scanning a simple Rust file
    (testpath/"test.rs").write('fn main() { println!("hello"); }')
    output = shell_output("#{bin}/qryon scan #{testpath} --format json 2>&1")
    assert_match "findings", output
  end
end

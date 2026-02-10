class Qryon < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/qryon"
  version "0.19.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-apple-darwin.tar.gz"
      sha256 "4f74448858ceae5fd72e872005a4900859c2847a76f98c129a27438c46d1c258"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-apple-darwin.tar.gz"
      sha256 "3a0685c7d4f859c06e966386df6e2d30485629cabe32ecb7922f398f8a1c6ba4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b8d7bf6d838b8106d7e3d456b0cd5a7d1840e04aaa58d860ea9735ddcf4754d"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c39d8332b15c79ecb502b10e81bbb71b11ecf42f9172ef17d1f94a9e5955b16"
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

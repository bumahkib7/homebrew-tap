class Qryon < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/qryon"
  version "0.20.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.1/qryon-aarch64-apple-darwin.tar.gz"
      sha256 "ad194d136bc7564c2c95dc65b8d454ee7dc8f53805b5567c37782b1b9041b56c"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.1/qryon-x86_64-apple-darwin.tar.gz"
      sha256 "9559b910f8e7e6a9d589333ae2ea415373d5e5062d025bde52377e71aca79bb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.1/qryon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35c8d465b0004da5823b5e228b1ca58de9263e65876d40d1236c71693ffdd5ec"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.20.1/qryon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61f344afc9be26ecbb77fa54a0caa37dab7776fa6c30c3b87fcbde490c247583"
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

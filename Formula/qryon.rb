class Qryon < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/qryon"
  version "0.19.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-apple-darwin.tar.gz"
      sha256 "f331a2559e544d591aa566ddb7cf494f0239123d8fb9c025fd387446c477100a"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-apple-darwin.tar.gz"
      sha256 "b509a641a7eff965a72e6669d815677b8a0665a2b1c8bdfc3b78ed5d474e2e96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b95dd474873d56ff91ca29466556300c93c4de910cf0879e4a5db54e2b416d4a"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f15419328ececf53149fe8a69490136de209b277683c85d37b284a0e689551e"
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

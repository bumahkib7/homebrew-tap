class Qryon < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/qryon"
  version "0.19.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-apple-darwin.tar.gz"
      sha256 "506d84d55f9c5f2e7c13e88b4e9ef5695788022d13f51cd922b2474cc3a4bb0e"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-apple-darwin.tar.gz"
      sha256 "7202307a7b0fe842730405ca0190bb62ae4d1ec406b45db5d27af0a6b3743ebd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95b8cf9d6c34b76cd0ad9ebb8bd9a42f3e3f9083efad093b94b63bbe37d08f92"
    end
    on_intel do
      url "https://github.com/bumahkib7/qryon/releases/download/v0.19.1/qryon-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06abfa2719eb7571f02f887c88a564b8c60a52ee2e46ecfed50696d25bd1d834"
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

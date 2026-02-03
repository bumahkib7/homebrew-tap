class Rma < Formula
  desc "Ultra-fast Rust-native code intelligence and security analyzer"
  homepage "https://github.com/bumahkib7/rust-monorepo-analyzer"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.17.0/rma-aarch64-apple-darwin.tar.gz"
      sha256 "e74de82872304f304f4c0a9a18b4286aa3ec70eda3ad126502236154524e4872"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.17.0/rma-x86_64-apple-darwin.tar.gz"
      sha256 "d250fbcd2c591bcd19ade3dcfb9bb50bf8e8fe96bcaa0231db037364d9ec7da4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.17.0/rma-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87bec7810909d6632248fb508fffc5ea0fa40819f3f529e3d07d1682a55f7a71"
    end
    on_intel do
      url "https://github.com/bumahkib7/rust-monorepo-analyzer/releases/download/v0.17.0/rma-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77961449db96fdcb5b00fc770c018146be6c8ddc7353dfd39e000d08dfb3d1d9"
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

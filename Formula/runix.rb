class Runix < Formula
  desc "Zero-config cloud deployment CLI — deploy any repo to production on Kubernetes"
  homepage "https://runixcloud.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bumahkib7/runix/releases/download/v#{version}/runix-aarch64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/bumahkib7/runix/releases/download/v#{version}/runix-x86_64-apple-darwin.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bumahkib7/runix/releases/download/v#{version}/runix-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    else
      url "https://github.com/bumahkib7/runix/releases/download/v#{version}/runix-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    end
  end

  def install
    bin.install "runix"
  end

  test do
    assert_match "runix", shell_output("#{bin}/runix --version")
  end
end

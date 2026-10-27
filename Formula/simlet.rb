class Simlet < Formula
  desc "Friendly commands for iOS Simulator, on top of xcrun simctl"
  homepage "https://github.com/raisiqueira/simlet-cli"
  version "0.1.0"
  license "MIT"

  depends_on macos: :ventura

  on_arm do
    url "https://github.com/raisiqueira/simlet-cli/releases/download/v0.1.0/simlet-0.1.0-macos-arm64.tar.gz"
    sha256 "fa141228aca65a13a8dbb7ae72165046b9a210a4fc29ee14566ec6ee7a9b5e88"
  end

  on_intel do
    url "https://github.com/raisiqueira/simlet-cli/releases/download/v0.1.0/simlet-0.1.0-macos-x86_64.tar.gz"
    sha256 "a74f23c4a2a5fc528f24455f89853fab16e9092065ab46c8d9c57b729c13ac64"
  end

  def install
    bin.install "simlet"
    generate_completions_from_executable(bin/"simlet", "--generate-completion-script")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/simlet --version").strip
  end
end

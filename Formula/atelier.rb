class Atelier < Formula
  desc "Bring-your-own-model coding harness for AI software engineering"
  homepage "https://github.com/ChrisAdkin8/atelier"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisAdkin8/atelier/releases/download/v#{version}/atelier-cli-aarch64-apple-darwin.tar.gz"
      sha256 "0cde16ad189baed6290560d4a2fd884fe38ee7238b31608aa946a0b80ad63fb5"
    else
      odie "Atelier v#{version} does not ship an Intel macOS bottle yet; use Apple Silicon or Linux."
    end
  end

  on_linux do
    url "https://github.com/ChrisAdkin8/atelier/releases/download/v#{version}/atelier-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39e94a98304584d1b022d895cbaefa76bca96bbf10d8d9c62c3526fb99c238c9"
  end

  def install
    bin.install "atelier"
  end

  test do
    system "#{bin}/atelier", "--version"
  end
end

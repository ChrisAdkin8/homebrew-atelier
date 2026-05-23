class Atelier < Formula
  desc "Bring-your-own-model coding harness for AI software engineering"
  homepage "https://github.com/ChrisAdkin8/atelier"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisAdkin8/atelier/releases/download/v#{version}/atelier-cli-aarch64-apple-darwin.tar.gz"
      sha256 "30873904db1dcdaf694611d4ee9133162bf41a510de66e0371a882aff19e6ee1"
    else
      odie "Atelier v#{version} does not ship an Intel macOS bottle yet; use Apple Silicon or Linux."
    end
  end

  on_linux do
    url "https://github.com/ChrisAdkin8/atelier/releases/download/v#{version}/atelier-cli-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eb5c3af6c6cb2d65bfb639f2a97f8c4e7e9cb39bf7e684615762b93637861eec"
  end

  def install
    bin.install Dir["atelier-cli-*/atelier"].first
  end

  test do
    system "#{bin}/atelier", "--version"
  end
end

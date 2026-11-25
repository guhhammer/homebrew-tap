# lore for Homebrew, from the release's binaries (macOS and Linux, Intel
# and ARM). Lives in a tap: github.com/guhhammer/homebrew-tap, as
# Formula/lore.rb; then `brew install guhhammer/tap/lore`. Homebrew does
# not quarantine what it installs, so the unsigned macOS binary runs.
# packaging/update.sh fills in the version and the checksums for a release.
class Lore < Formula
  desc "Every command you can type, A to Z, with an offline page for each"
  homepage "https://github.com/guhhammer/lore"
  version "0.4.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/guhhammer/lore/releases/download/v0.4.9/lore-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "e3d0de94da40f09db3c207d0422593fab23a98782f6e7b11c0343a75549010b9"
    end
    on_intel do
      url "https://github.com/guhhammer/lore/releases/download/v0.4.9/lore-v0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "e262b6aace45f9aa4cf44d762804c868dc5b42f15e7eb4c4369aa48a1decd8a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guhhammer/lore/releases/download/v0.4.9/lore-v0.4.9-aarch64-unknown-linux-musl.tar.gz"
      sha256 "abd2c15b0f87a4b9b8f6d87282afb7f0c7b53748d2989f176ea5ea02eb8ffda0"
    end
    on_intel do
      url "https://github.com/guhhammer/lore/releases/download/v0.4.9/lore-v0.4.9-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cd169dfc7f15496c75a5d481368488187cbc29c7e468ad3e951e95cbeb8ebf6b"
    end
  end

  def install
    bin.install "lore"
    man1.install "lore.1"
    bash_completion.install "completions/lore.bash" => "lore"
    zsh_completion.install "completions/_lore"
    fish_completion.install "completions/lore.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lore --version")
    assert_match "HOW TO USE", shell_output("#{bin}/lore --print tar")
  end
end

class SimpleChatgpt < Formula
  desc "Simple command-line tool to use ChatGPT Desktop from your Mac terminal"
  homepage "https://github.com/simple-toolbox/simple-chatgpt"
  license "MIT"
  url "https://github.com/simple-toolbox/simple-chatgpt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c2094611d376fd61f3a52438a49d62fe55e71d6823c6b9ed842c226a81b8ad9a"
  version "0.2.0"
  head "https://github.com/simple-toolbox/simple-chatgpt.git", branch: "main"

  def install
    bin.install "simple-chatgpt"
    pkgshare.install "share/simple-chatgpt/simple-chatgpt.shortcut"
  end

  def caveats
    <<~EOS
      Import the Shortcut into the Shortcuts app:
        open "#{pkgshare}/simple-chatgpt.shortcut"
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/simple-chatgpt -h")
  end
end

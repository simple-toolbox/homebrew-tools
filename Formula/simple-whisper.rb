class SimpleWhisper < Formula
  desc "Simple command-line tool to transcribe audio with whisper.cpp and clean transcripts with ChatGPT"
  homepage "https://github.com/simple-toolbox/simple-whisper"
  license "MIT"
  url "https://github.com/simple-toolbox/simple-whisper/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "df4053ec9a1cb62d12e3e9fc58361ea5903b33f1fdf15aa2a616714f85294cf3"
  version "0.1.0"
  head "https://github.com/simple-toolbox/simple-whisper.git", branch: "main"

  depends_on "ffmpeg"
  depends_on "whisper-cpp"
  depends_on "simple-toolbox/tools/simple-chatgpt"

  uses_from_macos "curl"

  def install
    bin.install "simple-whisper"
    chmod 0755, bin/"simple-whisper"

    pkgshare.install "prompt.txt"

    pkgshare.install "scripts/download-model.sh"
    chmod 0755, pkgshare/"download-model.sh"
  end

  def caveats
    <<~EOS
      The whisper.cpp model (~1.8GB) is not installed automatically.
      Download it after install with:
        #{opt_pkgshare}/download-model.sh

      The model will be saved to: $HOME/models/whisper/ggml-large-v3-turbo.bin
    EOS
  end

  test do
    assert_match "Usage: simple-whisper", shell_output("#{bin}/simple-whisper -h")
  end
end

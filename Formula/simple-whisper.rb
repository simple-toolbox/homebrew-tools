class SimpleWhisper < Formula
  desc "Simple command-line tool to transcribe audio with whisper.cpp and clean transcripts with ChatGPT"
  homepage "https://github.com/simple-toolbox/simple-whisper"
  license "MIT"
  url "https://github.com/simple-toolbox/simple-whisper/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a44e331b52dcbad6d6c6f8f32eb6cabfb2c6776e31fc9b85c417960a3f636d7"
  version "0.2.0"
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

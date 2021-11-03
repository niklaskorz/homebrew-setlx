class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "https://randoom.org/Software/SetlX/"
  url "https://download.randoom.org/setlX/pc/setlX_v2-7-2.binary_only.zip"
  version "2.7.2"
  sha256 "f0afd23148a6cba0406bfea76cdce30fc447f347f297fbca884fffb63fbd2c5b"

  depends_on "openjdk"
  depends_on "rlwrap"

  def install
    system "sed", "-i", ".original", "s,setlXJarDirectory=\".\",setlXJarDirectory=\"#{prefix}/\",g", "./setlX"
    system "sed", "-i", ".original", "s,setlXlibraryPath=\"$HOME/setlXlibrary/\",setlXlibraryPath=\"#{prefix}/setlXlibrary/\",g", "./setlX"
    bin.install "setlX"
    prefix.install %w[setlX.jar setlX-gfx.jar setlX-plot.jar setlX-stat.jar setlXlibrary]
  end

  test do
    system "#{bin}/setlX", "--version"
  end
end

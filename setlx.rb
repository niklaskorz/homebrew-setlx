class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "http://setlx.randoom.org"
  url "http://download.randoom.org/setlX/pc/setlX_v2-5-3.binary_only.zip"
  version "2.5.3"
  sha256 "c3a487777085ea18b4db6479c7613ff4a7e547edfc6896d65b6cb3cc3bcdf4bd"

  depends_on :java => "1.7+"
  bottle :unneeded

  def install
    system "sed", "-i", ".original", "s,setlXJarDirectory=\".\",setlXJarDirectory=\"#{prefix}/\",g", "./setlX"
    system "sed", "-i", ".original", "s,setlXlibraryPath=\"$HOME/setlXlibrary/\",setlXlibraryPath=\"#{prefix}/setlXlibrary/\",g", "./setlX"
    bin.install "setlX"
    prefix.install %w[setlX.jar setlX-gfx.jar setlX-plot.jar setlXlibrary]
  end

  test do
    system "#{bin}/setlX", "--version"
  end
end

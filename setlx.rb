class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "https://randoom.org/Software/SetlX"
  url "http://download.randoom.org/setlX/pc/setlX_v2-7-0.binary_only.zip"
  version "2.7.0"
  sha256 "876c8aad46fc8c08e71d55fc0e6b9a46d753f16ea9655d1beae76d170b1f2de3"

  depends_on :java => "1.7+"
  depends_on "rlwrap" => :recommended
  bottle :unneeded

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

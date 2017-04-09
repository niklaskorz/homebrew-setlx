class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "https://randoom.org/Software/SetlX"
  url "http://download.randoom.org/setlX/pc/setlX_v2-6-1.binary_only.zip"
  version "2.6.1"
  sha256 "a88b3dca6e03667adfd0d62e628c241fa6e0c5b28ef95530da9febe5b4377cc5"

  depends_on :java => "1.7+"
  depends_on "rlwrap" => :recommended
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

class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "https://randoom.org/Software/SetlX"
  url "http://download.randoom.org/setlX/pc/setlX_v2-6-0.binary_only.zip"
  version "2.6.0"
  sha256 "e3627decb0c0fd1fb00f202d4647c2026d28e61e7d9e0d3edbd4dd8a86d9f025"

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

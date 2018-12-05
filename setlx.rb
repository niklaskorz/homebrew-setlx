class Setlx < Formula
  desc "SetlX is an interpreter for the high level programming-language SetlX (set language extended)."
  homepage "https://randoom.org/Software/SetlX/"
  url "https://download.randoom.org/setlX/pc/setlX_v2-7-1.binary_only.zip"
  version "2.7.1"
  sha256 "fd28c0e718fcabfeff6a85d60937d91a2fd690be5bc5b21014ae2b6dd688b3d5"

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

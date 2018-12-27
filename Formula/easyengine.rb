class Easyengine < Formula
  desc "Command-line control panel to manage WordPress sites"
  homepage "https://easyengine.io/"
  url "https://github.com/abhijitrakas/easyengine/releases/download/v4.0.18/easyengine.phar"
  sha256 "dbd9629d5ea6f0c138616395bbd0a1e692d941d4053886eafce5c5c43d41b36a"

  bottle :unneeded

  depends_on "dnsmasq"
  depends_on "php"

  def install
    bin.install "easyengine.phar" => "ee"
  end

  test do
    system bin/"ee config set locale hi_IN"
    output = shell_output("#{bin}/ee config get locale")
    assert_match "hi_IN", output

    output = shell_output("#{bin}/ee cli version")
    assert_match "EE #{version}", output

    output = shell_output("#{bin}/ee cli info")
    assert_match "Darwin", output
  end
end

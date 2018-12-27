class Easyengine < Formula
  desc "Command-line control panel to manage WordPress sites"
  homepage "https://easyengine.io/"
  url "https://github.com/abhijitrakas/easyengine/releases/download/v4.0.9/easyengine.phar"
  sha256 "3952a35ceae9f9095b5d996870af2ecd22b1fece1235ef796252d0da8d80d36a"
  revision 1

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

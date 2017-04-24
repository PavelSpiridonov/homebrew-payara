class Payara < Formula
  desc ""
  homepage ""
  url "https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/Payara+4.1.1.171.1/payara-4.1.1.171.1.zip"
  version "4.1.1.171.1"
  sha256 "6567a95d104586b580274581ebcddd55a2d52e890340963886f7b3ae3d973da8"

  bottle :unneeded

  depends_on :java

  def install
    # Remove windows files
    rm_rf Dir["bin/*.bat"]
    rm_rf Dir["glassfish/bin/*.bat"]
    libexec.install Dir["*", ".org.opensolaris,pkg"]
    Pathname.glob("#{libexec}/bin/*") do |file|
      next if file.directory?
      basename = file.basename
      (bin/basename).write_env_script file, Language::Java.overridable_java_home_env
    end
  end


  conflicts_with "glassfish", :because => "also installs a 'glassfish' executable"

end

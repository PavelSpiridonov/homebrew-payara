class Payara < Formula
  desc ""
  homepage ""
  url "https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/Payara+4.1.2.173/payara-4.1.2.173.zip"
  version "4.1.2.173"
  sha256 "944fae8fa38e83cf291e6176152827113a4733174096c49a2cf3d218ba1ad7f2"

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

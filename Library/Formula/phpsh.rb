require 'formula'

class Phpsh <Formula
  url 'git://github.com/facebook/phpsh.git'
  homepage 'http://github.com/facebook/phpsh'
  version "1.3"

  def install
    puts "python setup.py install --prefix=#{prefix}"
    system "python setup.py install --prefix=#{prefix}"
  end
  
  def caveats
    return <<-CAVEATS
Before you can use phpsh, you need to update your python path in your ~/.profile:
export PYTHONPATH="#{prefix.to_s}/lib/python2.6/site-packages:$PYTHONPATH"
    CAVEATS
  end
end

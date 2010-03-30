require 'formula'

class RedisUnstable <Formula
  head 'git://github.com/antirez/redis.git', :tag => 'v1.3.8'
  homepage 'http://code.google.com/p/redis/'

  def install
    %w( run db/redis log ).each do |path|
      (var+path).mkpath
    end

    ENV.gcc_4_2
    system "make"
    bin.install %w( redis-benchmark redis-cli redis-server redis-check-dump )
    
    # Fix up default conf file to match our paths
    inreplace "redis.conf" do |s|
      s.gsub! "/var/run/redis.pid", "#{var}/run/redis.pid"
      s.gsub! "dir ./", "dir #{var}/db/redis/"
    end
    
    etc.install "redis.conf"
  end

  def caveats
    "To start redis: $ redis-server #{etc}/redis.conf"
  end
end

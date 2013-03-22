require 'test/unit'
require './country_ip'

class CountryIpTest < Test::Unit::TestCase

  def setup
    @country_ip = CountryIp.new
  end
  
  def test_bad_input_raises_exception
    assert_raises ArgumentError do
      @country_ip.search("Foo")
    end
  end
  
  def test_invalid_ip_raises_exception
    invalid_ips = %w(300.10.10.10 10.300.10.10 10.10.300.10 10.10.10.300)
    
    invalid_ips.each do |invalid_ip|
      assert_raises ArgumentError do
        @country_ip.search(invalid_ip)
      end
    end
  end

  def test_csv_file_not_changed
    assert_equal '22620fdd50ebaef84dd3d9521beb6a7c', `md5 -q IpToCountry.csv`.strip
  end
  
  def test_67_99_163_76_is_United_States
    assert_equal "United States", @country_ip.search("67.99.163.76")
  end

  def test_10_12_14_19_is_Reserved
    assert_equal "Reserved", @country_ip.search("10.12.14.19")
  end

  def test_200_100_100_100_is_Brazil
    assert_equal "Brazil", @country_ip.search("200.100.100.100")
  end
  
end

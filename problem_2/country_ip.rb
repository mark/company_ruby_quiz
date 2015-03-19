require 'csv'
require 'ipaddr'

class CountryIp

  def initialize # :nodoc:
    slurpped_csv = slurp_file 'IpToCountry.csv'
    @lookup_csv = slurpped_csv.map { |line| line_to_mapping line }
  end

  # :call-seq:
  # search dotted_ip_address
  #
  # yields a country for a given dotted IP address

  def search(ip_string)
    addr_as_i = ip_to_i ip_string
    range = @lookup_csv.select { |row| addr_as_i > row[0].to_i && addr_as_i < row[1].to_i }.first
    range[2]
  end

  private

  # :call-seq:
  # slurp_file filename
  #
  # read a file, ignoring comments
  # show errors to STDERR

  def slurp_file(filename)
    # CSV::MalformedCSVError: Illegal quoting in line 50.
    # CSV.readlines can not parse line 50, therefore, slurp the file... ignoring comments
    non_commented_lines = []
    slurpped = IO.readlines filename
    slurpped.each_with_index do |line, i|
      begin
        next if line.match(/\A\s?\#/)
        non_commented_lines.push line

          # TODO: determine howto handle these errors
          # error in line 225: invalid byte sequence in UTF-8
          # error in line 98066: invalid byte sequence in UTF-8
      rescue ArgumentError => err
        $stderr.puts "error in line #{i+1}: #{err.message}"
      end
    end
    non_commented_lines
  end

  # :call-seq:
  # line_to_mapping line
  #
  # converts a CSV line to an array
  # greps from, to and country from CSV

  def line_to_mapping(line)
    csv_mapping = []
    CSV.parse(line) do |csv|
      from = csv[0]
      to = csv[1]
      csv_mapping.push from, to, csv[6]
    end
    csv_mapping
  end

  # :call-seq:
  # ip_to_i IP
  #
  # converts an IP address to an integer

  def ip_to_i(addr)
    begin
      IPAddr.new(addr).to_i

        # NOTE: spec requires ArgumentError
    rescue IPAddr::InvalidAddressError => err
      msg = "#{err.message} #{addr.inspect}"
      $stderr.puts msg
      raise ArgumentError, msg
    end
  end
end
